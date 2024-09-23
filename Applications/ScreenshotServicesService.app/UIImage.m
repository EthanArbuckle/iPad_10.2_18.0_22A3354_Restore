@implementation UIImage

+ (id)_sss_imageFromScreenshot:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  __int128 v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  double v39;
  double v40;
  uint64_t v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  v3 = a3;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageGenerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "generateImageForScreenshot:", v3));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "backingImage"));
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentDescription"));
  objc_msgSend(v8, "imagePixelSize");
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environmentDescription"));
  objc_msgSend(v13, "imageScale");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelModificationInfo"));
  v17 = v16;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  if (v16)
    objc_msgSend(v16, "cropInfo");
  objc_msgSend(v17, "vellumOpacity");
  v19 = v18;
  v20 = v10 / v15;
  v47 = v49;
  v21 = v50;
  v22 = v12 / v15;
  v23 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  objc_msgSend(v23, "setScale:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "originalAnnotations"));
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v23, v20, v22);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100006224;
    v43[3] = &unk_100091820;
    v45 = v20;
    v46 = v22;
    v44 = v17;
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "imageWithActions:", v43));

  }
  v27 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v23, v21);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000652C;
  v34[3] = &unk_100091888;
  v37 = v47;
  v38 = v21;
  v39 = v20;
  v40 = v22;
  v41 = v19;
  v42 = v21;
  v35 = v7;
  v36 = v25;
  v28 = v25;
  v29 = v7;
  v30 = objc_retainBlock(v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "imageWithActions:", v30));

  return v31;
}

- (void)setAssociatedScreenshot:(id)a3
{
  objc_setAssociatedObject(self, "_UIImageSSSAssociatedScreenshotKey", a3, 0);
}

- (SSSScreenshot)associatedScreenshot
{
  return (SSSScreenshot *)objc_getAssociatedObject(self, "_UIImageSSSAssociatedScreenshotKey");
}

@end
