@implementation PDFDocument

- (id)asImage
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;

  if (-[PDFDocument pageCount](self, "pageCount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v4 = -[PDFDocument pageCount](self, "pageCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDFDocument pageAtIndex:](self, "pageAtIndex:", i));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithBox:", 1));
        objc_msgSend(v3, "addObject:", v8);

      }
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDFDocument _stitchPageImages:](self, "_stitchPageImages:", v3));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_stitchPageImages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  void *i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  void *j;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UIImage *ImageFromCurrentImageContext;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  CGSize v44;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v39;
        v9 = 0.0;
        v10 = 0.0;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v8)
              objc_enumerationMutation(v5);
            v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v12, "size");
            v14 = v13;
            objc_msgSend(v12, "scale");
            v16 = v14 * v15;
            objc_msgSend(v12, "size");
            v18 = v17;
            objc_msgSend(v12, "scale");
            v20 = v18 * v19;
            if (v16 > v10)
              v10 = v16;
            v9 = v9 + v20;
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v7);
      }
      else
      {
        v9 = 0.0;
        v10 = 0.0;
      }

      v44.width = v10;
      v44.height = v9;
      UIGraphicsBeginImageContext(v44);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v21 = v5;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v35;
        v25 = 0.0;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v35 != v24)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
            objc_msgSend(v27, "size", (_QWORD)v34);
            objc_msgSend(v27, "scale");
            objc_msgSend(v27, "size");
            v29 = v28;
            objc_msgSend(v27, "scale");
            v31 = v29 * v30;
            objc_msgSend(v27, "drawInRect:", 0.0, v25, v10, v31);
            v25 = v25 + v31;
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v23);
      }

      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v4 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
