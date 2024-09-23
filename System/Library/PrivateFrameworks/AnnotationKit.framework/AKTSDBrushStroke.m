@implementation AKTSDBrushStroke

+ (AKTSDBrushStroke)strokeWithName:(id)a3 color:(id)a4 width:(double)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:color:width:join:miterLimit:", v7, v8, 0, a5, 10.0);

  return (AKTSDBrushStroke *)v9;
}

+ (AKTSDBrushStroke)strokeWithType:(int64_t)a3 color:(id)a4 width:(double)a5
{
  id v7;
  __CFString *v8;

  v7 = a4;
  v8 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_7;
    case 1:
      v8 = CFSTR("Chalk2");
      goto LABEL_6;
    case 2:
      v8 = CFSTR("Pen");
      goto LABEL_6;
    case 3:
      v8 = CFSTR("Feathered Brush");
      goto LABEL_6;
    case 4:
      v8 = CFSTR("Dry Brush");
      goto LABEL_6;
    default:
LABEL_6:
      v8 = (__CFString *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:color:width:join:miterLimit:", v8, v7, 0, a5, 10.0);
LABEL_7:

      return (AKTSDBrushStroke *)v8;
  }
}

- (AKTSDBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 join:(int)a6 miterLimit:(double)a7
{
  id v12;
  id v13;
  AKTSDBrushStroke *v14;
  uint64_t v15;
  NSString *strokeName;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AKTSDBrushStroke;
  v14 = -[AKTSDBrushStroke init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    strokeName = v14->_strokeName;
    v14->_strokeName = (NSString *)v15;

    objc_storeStrong((id *)&v14->_color, a4);
    v14->_join = a6;
    v14->_width = a5;
    v14->_miterLimit = a7;
  }

  return v14;
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AKTSDMutableBrushStroke *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  AKTSDMutableBrushStroke *v11;

  v4 = [AKTSDMutableBrushStroke alloc];
  -[AKTSDBrushStroke strokeName](self, "strokeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDBrushStroke color](self, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDBrushStroke width](self, "width");
  v8 = v7;
  v9 = -[AKTSDBrushStroke join](self, "join");
  -[AKTSDBrushStroke miterLimit](self, "miterLimit");
  v11 = -[AKTSDBrushStroke initWithName:color:width:join:miterLimit:](v4, "initWithName:color:width:join:miterLimit:", v5, v6, v9, v8, v10);

  return v11;
}

+ (id)cacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Brushes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  return v4;
}

+ (void)loadBrush:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  sub_22901F124();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22901F164;
  block[3] = &unk_24F1A7CD0;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

+ (void)loadLineEndsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  float v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  __int128 v34;
  CGFloat a;
  double b;
  double d;
  double c;
  double tx;
  double ty;
  const CGPath *v41;
  CGPath *Mutable;
  const CGPath *v43;
  CGPath *v44;
  double MaxX;
  CGFloat MidY;
  void *v47;
  id obj;
  uint64_t v49;
  id v50;
  uint64_t v51;
  CGFloat v52;
  float v53;
  _xmlDoc *v54;
  double v55;
  void *v56;
  void *v57;
  CGAffineTransform v58;
  CGAffineTransform m;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  v70 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v54 = a4;
  sub_22901F644(a4, CFSTR("//svg:path['_wrap'=substring(@id,string-length(@id)-4)]"));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v5)
  {
    v49 = *(_QWORD *)v66;
    do
    {
      v51 = v5;
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v66 != v49)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "objectForKey:", CFSTR("nodeAttributes"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("d"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("id"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//svg:path[@id='%@_end']"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        sub_22901F644(v54, v11);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("nodeAttributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKey:", CFSTR("d"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//svg:rect[@id='%@_end_bounds']"), v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        sub_22901F644(v54, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", CFSTR("nodeAttributes"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "objectForKey:", CFSTR("x"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v20 = v19;

        objc_msgSend(v17, "objectForKey:", CFSTR("y"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v23 = v22;

        objc_msgSend(v17, "objectForKey:", CFSTR("width"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "floatValue");
        v26 = v25;

        objc_msgSend(v17, "objectForKey:", CFSTR("height"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;

        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v50, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = v26;
        v32 = v20;
        v33 = v29;
        v34 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        *(_OWORD *)&v63.a = *MEMORY[0x24BDBD8B8];
        *(_OWORD *)&v63.c = v34;
        *(_OWORD *)&v63.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
        CGAffineTransformTranslate(&v64, &v63, 0.0, -0.5);
        v62 = v64;
        CGAffineTransformScale(&v64, &v62, 2.0 / v33, 2.0 / v33);
        v61 = v64;
        v52 = v23;
        CGAffineTransformTranslate(&v64, &v61, -v20, -v23);
        v60 = v64;
        CGAffineTransformRotate(&v64, &v60, -1.57079633);
        a = v64.a;
        b = v64.b;
        c = v64.c;
        d = v64.d;
        tx = v64.tx;
        ty = v64.ty;
        v41 = sub_2290683C8(v8);
        v55 = a;
        m.a = a;
        m.b = b;
        m.c = c;
        m.d = d;
        m.tx = tx;
        m.ty = ty;
        Mutable = CGPathCreateMutable();
        CGPathAddPath(Mutable, &m, v41);
        v43 = sub_2290683C8(v56);
        v58.a = a;
        v58.b = b;
        v58.c = c;
        v58.d = d;
        v58.tx = tx;
        v58.ty = ty;
        v44 = CGPathCreateMutable();
        CGPathAddPath(v44, &v58, v43);
        v71.origin.x = v32;
        v71.origin.y = v52;
        v71.size.width = v53;
        v71.size.height = v33;
        MaxX = CGRectGetMaxX(v71);
        v72.origin.x = v32;
        v72.origin.y = v52;
        v72.size.width = v53;
        v72.size.height = v33;
        MidY = CGRectGetMidY(v72);
        +[AKTSDLineEnd lineEndWithPath:wrapPath:endPoint:isFilled:identifier:](AKTSDLineEnd, "lineEndWithPath:wrapPath:endPoint:isFilled:identifier:", v44, Mutable, 1, v31, tx + c * MidY + v55 * MaxX, ty + d * MidY + b * MaxX);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)qword_255A27098, "setObject:forKey:", v47, v31);
        CGPathRelease(v43);
        CGPathRelease(v44);
        CGPathRelease(v41);
        CGPathRelease(Mutable);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v5);
  }

}

+ (void)loadSectionsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  const CGPath *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  objc_msgSend((id)qword_255A270A8, "objectForKey:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_255A270A8, "setObject:forKey:", v4, v37);
  }
  v43 = (void *)v4;
  objc_msgSend((id)qword_255A270B0, "objectForKey:", v37);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_255A270B0, "setObject:forKey:", v5, v37);
  }
  v42 = (void *)v5;
  sub_22901F644(a4, CFSTR("//svg:path['_section'=substring(@id,string-length(@id)-7)]"));
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v6)
  {
    v39 = *(_QWORD *)v53;
    do
    {
      v41 = v6;
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "objectForKey:", CFSTR("nodeAttributes"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("d"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("id"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//svg:rect[@id='%@_bounds']"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        sub_22901F644(a4, v10);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("nodeAttributes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectForKey:", CFSTR("x"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v15 = v14;

        objc_msgSend(v12, "objectForKey:", CFSTR("y"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        objc_msgSend(v12, "objectForKey:", CFSTR("width"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        v21 = v20;

        objc_msgSend(v12, "objectForKey:", CFSTR("height"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v24 = v23;

        v25 = sub_2290683C8(v44);
        +[AKTSDBezierPath bezierPathWithCGPath:](AKTSDBezierPath, "bezierPathWithCGPath:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v15;
        v28 = v18;
        v29 = v21;
        v30 = v24;
        v31 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        *(_OWORD *)&v51.a = *MEMORY[0x24BDBD8B8];
        *(_OWORD *)&v51.c = v31;
        *(_OWORD *)&v51.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
        *(_OWORD *)&v50.a = *(_OWORD *)&v51.a;
        *(_OWORD *)&v50.c = v31;
        *(_OWORD *)&v50.tx = *(_OWORD *)&v51.tx;
        CGAffineTransformTranslate(&v51, &v50, 0.0, -0.5);
        v48 = v51;
        CGAffineTransformScale(&v49, &v48, 1.0 / v29, 1.0 / v30);
        v51 = v49;
        v47 = v49;
        CGAffineTransformTranslate(&v49, &v47, -v27, -v28);
        v51 = v49;
        v46 = v49;
        objc_msgSend(v26, "transformUsingAffineTransform:", &v46);
        objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "rangeOfString:", CFSTR("_")));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v26;
        objc_msgSend(v43, "objectForKey:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setObject:forKey:", v34, v32);
        }
        objc_msgSend(v42, "objectForKey:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v35)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setObject:forKey:", v35, v32);
        }
        objc_msgSend(v34, "addObject:", v33);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v27, v28, v29, v30);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "addObject:", v36);

        CGPathRelease(v25);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v6);
  }

}

- (id)brushPathsForId:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[AKTSDBrushStroke strokeName](self, "strokeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKTSDBrushStroke loadBrush:](AKTSDBrushStroke, "loadBrush:", v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_22902065C;
  v17 = sub_22902066C;
  v18 = 0;
  sub_22901F124();
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_229020674;
  v10[3] = &unk_24F1A7CF8;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)brushBoundsForId:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[AKTSDBrushStroke strokeName](self, "strokeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKTSDBrushStroke loadBrush:](AKTSDBrushStroke, "loadBrush:", v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_22902065C;
  v17 = sub_22902066C;
  v18 = 0;
  sub_22901F124();
  v6 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2290207E0;
  v10[3] = &unk_24F1A7CF8;
  v11 = v4;
  v12 = &v13;
  v7 = v4;
  dispatch_sync(v6, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)strokeLineEnd:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  if (objc_msgSend(v4, "isNone"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTSDBrushStroke strokeName](self, "strokeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hasPrefix:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = objc_msgSend(v6, "rangeOfString:", CFSTR(":"));
      if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "substringFromIndex:", v9 + v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[AKTSDBrushStroke strokeName](self, "strokeName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%@"), v13, v6);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v14;
    }
    -[AKTSDBrushStroke strokeName](self, "strokeName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKTSDBrushStroke loadBrush:](AKTSDBrushStroke, "loadBrush:", v15);

    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_22902065C;
    v26 = sub_22902066C;
    v27 = 0;
    sub_22901F124();
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_229020A38;
    block[3] = &unk_24F1A7CF8;
    v20 = v6;
    v21 = &v22;
    v17 = v6;
    dispatch_sync(v16, block);

    v5 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

  }
  return v5;
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7
{
  CGFloat y;
  CGFloat x;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  CGContextSaveGState(a7);
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&v23, x, y);
  v21 = v23;
  CGAffineTransformScale(&v22, &v21, a6, a6);
  v23 = v22;
  v20 = v22;
  CGAffineTransformRotate(&v22, &v20, a5);
  v23 = v22;
  v19 = v22;
  objc_msgSend(v13, "endPoint");
  v15 = v14;
  objc_msgSend(v13, "endPoint");
  CGAffineTransformTranslate(&v22, &v19, -v15, -v16);
  v23 = v22;
  v18 = v22;
  CGContextConcatCTM(a7, &v18);
  CGContextAddPath(a7, (CGPathRef)objc_msgSend(v13, "path"));
  if (objc_msgSend(v13, "isFilled"))
  {
    CGContextFillPath(a7);
  }
  else
  {
    -[AKTSDBrushStroke width](self, "width");
    CGContextSetLineWidth(a7, v17 / a6);
    CGContextSetLineJoin(a7, (CGLineJoin)objc_msgSend(v13, "lineJoin"));
    CGContextStrokePath(a7);
  }
  CGContextRestoreGState(a7);

}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  _BOOL4 v8;
  double y;
  double x;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;

  v8 = a8;
  y = a4.y;
  x = a4.x;
  v15 = a3;
  v23 = v15;
  if (v8)
  {
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rangeOfString:", CFSTR(":"));
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v23;
    }
    else
    {
      objc_msgSend(v16, "substringFromIndex:", v17 + v18);
      v21 = objc_claimAutoreleasedReturnValue();

      +[AKTSDLineEnd lineEndWithIdentifier:](AKTSDLineEnd, "lineEndWithIdentifier:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
      v19 = (id)v22;
    }
    v24 = v19;
    -[AKTSDBrushStroke paintLineEnd:atPoint:atAngle:withScale:inContext:](self, "paintLineEnd:atPoint:atAngle:withScale:inContext:", x, y, a5, a6);

  }
  else
  {
    -[AKTSDBrushStroke strokeLineEnd:](self, "strokeLineEnd:", v15);
    v20 = objc_claimAutoreleasedReturnValue();

    v24 = (id)v20;
    -[AKTSDBrushStroke paintLineEnd:atPoint:atAngle:withScale:inContext:](self, "paintLineEnd:atPoint:atAngle:withScale:inContext:", v20, a7, x, y, a5, a6);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDBrushStroke strokeName](self, "strokeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDBrushStroke width](self, "width");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p strokeName='%@' width=%f>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 withScaling:(id)a6 inElementRange:(_NSRange)a7 into:(id)a8 viewScale:(double)a9
{
  NSUInteger length;
  NSUInteger location;
  double var1;
  double var0;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  id v25;

  length = a7.length;
  location = a7.location;
  var1 = a6.var1;
  var0 = a6.var0;
  v25 = a3;
  v17 = a5;
  v18 = a8;
  -[AKTSDBrushStroke strokeName](self, "strokeName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDBrushStroke brushPathsForId:](self, "brushPathsForId:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKeyedSubscript:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "lineWidth");
    objc_msgSend(v22, "objectAtIndexedSubscript:", v23 < 15.0);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v24;
  }
  objc_msgSend(v22, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v17, location, length, v18, var0, var1);

}

- (void)brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 into:(id)a6 sectionIndex:(unint64_t *)a7 viewScale:(double)a8
{
  NSUInteger length;
  NSUInteger location;
  double var1;
  double var0;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  unint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  unint64_t v67;
  uint64_t v68;
  double v69;
  id v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  double v74;
  double v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  NSUInteger v87;
  id v88;

  length = a5.length;
  location = a5.location;
  var1 = a4.var1;
  var0 = a4.var0;
  v88 = a3;
  v16 = a6;
  if (objc_msgSend(v88, "elementCount") >= 2)
  {
    objc_msgSend(v88, "lineWidth");
    v18 = v17;
    -[AKTSDBrushStroke strokeName](self, "strokeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTSDBrushStroke brushPathsForId:](self, "brushPathsForId:", v19);
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKTSDBrushStroke strokeName](self, "strokeName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = length;
    -[AKTSDBrushStroke brushBoundsForId:](self, "brushBoundsForId:", v20);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v86, "objectForKey:", CFSTR("middle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0.0;
    if ((unint64_t)objc_msgSend(v21, "count") >= 2)
    {
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("middle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "CGRectValue");
      v25 = v24;
      v27 = v26;

      v83 = v25 / v27;
    }
    if (v18 < 5.0)
    {
      objc_msgSend(v86, "objectForKey:", CFSTR("small"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v84 = v28;
        v29 = objc_msgSend(v28, "count");
        objc_msgSend(v88, "length");
        v31 = v30;
        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("small"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v16;
        objc_msgSend(v33, "CGRectValue");
        v36 = v35;
        v38 = v37;

        v39 = var1 * v31 / (v18 * (v36 / v38));
        v40 = (uint64_t)v39;
        if ((uint64_t)v39 >= 1)
        {
          v41 = 0;
          v42 = 1.0 / (double)(uint64_t)v39;
          v43 = *a7;
          do
          {
            -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("small"), v43 % v29, v88, location, v87, v34, var0 + v42 * (double)v41 * var1, var1 * v42, a8);
            v44 = 1664525 * *a7 + 1013904223;
            if (v44 % v29 == *a7 % v29)
              v43 = v44 + 1;
            else
              v43 = 1664525 * *a7 + 1013904223;
            *a7 = v43;
            ++v41;
          }
          while (v40 != v41);
        }
        v16 = v34;
        v45 = v84;
        goto LABEL_39;
      }
    }
    objc_msgSend(v86, "objectForKey:", CFSTR("end"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v82 = v21;
      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("start"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "lastObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "CGRectValue");
      v50 = v49;
      v52 = v51;

      objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("end"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lastObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "CGRectValue");
      v56 = v55;
      v58 = v57;
      v81 = v18;

      objc_msgSend(v88, "length");
      v60 = v50 / v52;
      v61 = v56 / v58;
      v62 = var1 * v59;
      v63 = v60 + v56 / v58;
      v64 = v81 * v60 / (var1 * v59);
      if (v64 <= v60 / v63)
        v65 = v81 * v60 / (var1 * v59);
      else
        v65 = v60 / v63;
      -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("start"), 0, v88, location, length, v16, var0 + var1 * 0.0, var1 * v65, a8);
      v66 = v61 / v63;
      if (v81 * v61 / v62 <= v61 / v63)
        v66 = v81 * v61 / v62;
      -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("end"), 0, v88, location, length, v16, var0 + (1.0 - v66) * var1, var1 * v66, a8);
      v67 = objc_msgSend(v21, "count");
      v68 = (uint64_t)((v62 - v63 * v81) / (v81 * v83) + 1.0);
      v69 = (1.0 - v81 * v63 / v62) / (double)v68;
      if (v67 > 1)
      {
        if (v68 >= 1)
        {
          v70 = v16;
          v71 = 0;
          v72 = *a7;
          do
          {
            -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("middle"), v72 % v67, v88, location, v87, v70, var0 + (v64 + (double)v71 * v69) * var1, var1 * v69, a8);
            v73 = 1664525 * *a7 + 1013904223;
            if (v73 % v67 == *a7 % v67)
              v72 = v73 + 1;
            else
              v72 = 1664525 * *a7 + 1013904223;
            *a7 = v72;
            ++v71;
          }
          while (v68 != v71);
          v45 = 0;
          v16 = v70;
          goto LABEL_37;
        }
LABEL_36:
        v45 = 0;
LABEL_37:
        v21 = v82;
        goto LABEL_39;
      }
      if (v68 < 1)
        goto LABEL_36;
      v80 = 0;
      v21 = v82;
      do
        -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("middle"), 0, v88, location, length, v16, var0 + (v64 + (double)v80++ * v69) * var1, var1 * v69, a8);
      while (v68 != v80);
    }
    else
    {
      if (v83 <= 0.0)
      {
        -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("middle"), 0, v88, location, length, v16, var0, var1, a8);
        v45 = 0;
        goto LABEL_39;
      }
      objc_msgSend(v88, "length", v83);
      v75 = var1 * v74 / (v18 * v83);
      v76 = (uint64_t)v75;
      if ((uint64_t)v75 >= 1)
      {
        v77 = v16;
        v78 = 0;
        v79 = 1.0 / (double)(uint64_t)v75;
        do
          -[AKTSDBrushStroke brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:](self, "brushSection:sectionIndex:ontoPath:withScaling:inElementRange:into:viewScale:", CFSTR("middle"), 0, v88, location, v87, v77, var0 + v79 * (double)v78++ * var1, var1 * v79, a8);
        while (v76 != v78);
        v45 = 0;
        v16 = v77;
        goto LABEL_39;
      }
    }
    v45 = 0;
LABEL_39:

  }
}

- (void)brushPath:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  void *v7;
  double a;
  double b;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  BOOL v30;
  __int128 v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  double v41;
  double v42;
  double v43;
  id v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  _QWORD block[6];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  CGAffineTransform v55;
  __int128 v56;
  __int128 v57;
  double v58;
  double v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AKTSDBrushStroke strokeName](self, "strokeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKTSDBrushStroke loadBrush:](AKTSDBrushStroke, "loadBrush:", v7);

  -[AKTSDBrushStroke width](self, "width");
  objc_msgSend(v6, "setLineWidth:");
  -[AKTSDBrushStroke miterLimit](self, "miterLimit");
  objc_msgSend(v6, "setMiterLimit:");
  memset(&v55, 0, sizeof(v55));
  CGContextGetCTM(&v55, a4);
  a = v55.a;
  b = v55.b;
  +[AKTSDBezierPath bezierPath](AKTSDBezierPath, "bezierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineWidth");
  objc_msgSend(v10, "setLineWidth:");
  objc_msgSend(v10, "setWindingRule:", 0);
  v54 = 0;
  objc_msgSend(v6, "length");
  v12 = v11;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  sub_22901F124();
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_229021C8C;
  block[3] = &unk_24F1A7CF8;
  block[4] = self;
  block[5] = &v50;
  dispatch_sync(v13, block);

  v15 = *MEMORY[0x24BDBEFB0];
  v14 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v48 = *MEMORY[0x24BDBEFB0];
  v16 = objc_msgSend(v6, "elementCount");
  v46 = sqrt(b * b + a * a);
  if (v16 >= 1)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0.0;
    v45 = v12;
    v20 = 0.0;
    v21 = v15;
    while (1)
    {
      v22 = v20;
      v23 = objc_msgSend(v6, "elementAtIndex:associatedPoints:", v18, &v57);
      objc_msgSend(v6, "lengthOfElement:", v18);
      v20 = v20 + v24 / v12;
      switch(v23)
      {
        case 3:
          v57 = v48;
          break;
        case 2:
          if (*((_BYTE *)v51 + 24))
          {
            v47 = v21;
            v31 = v56;
            v32 = sub_22902DEF0(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v56);
            v34 = v33;
            v35 = sub_22902DF08(v32, v33);
            if (v35 >= 1.0)
            {
              v38 = sub_22902DEFC(v32, v34, 1.0 / v35);
            }
            else
            {
              v36 = sub_22902DEF0(v58, v59, *(double *)&v31);
              v38 = sub_22902DF3C(v36, v37);
            }
            v12 = v45;
            if (v18 < 2
              || (sub_22902DF5C(v47, v14, v38, v39) < 0.99 ? (v40 = (uint64_t)(~v17 + v18) < 1) : (v40 = 1),
                  v40 || v22 - v19 <= 0.0))
            {
              v22 = v19;
            }
            else
            {
              -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v18 - v17, v10, &v54, v19, v22 - v19, v46);
              v17 = v18 - 1;
            }
            v41 = sub_22902DEF0(*(double *)&v60, *((double *)&v60 + 1), v58);
            v21 = sub_22902DF3C(v41, v42);
            v14 = v43;
            v19 = v22;
          }
          v56 = v60;
          goto LABEL_34;
        case 0:
          if ((uint64_t)(v18 - v17) >= 1)
          {
            -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v19, v20 - v19, v46);
            v19 = v20;
            v17 = v18;
          }
          v56 = v57;
          v48 = v57;
          goto LABEL_34;
      }
      if (!*((_BYTE *)v51 + 24))
        break;
      v25 = sub_22902DEF0(*(double *)&v57, *((double *)&v57 + 1), *(double *)&v56);
      v28 = sub_22902DF3C(v25, v26);
      v29 = v27;
      if (v18 < 2)
        goto LABEL_22;
      v30 = sub_22902DF5C(v21, v14, v28, v27) >= 0.99 || (uint64_t)(~v17 + v18) < 1;
      if (v30 || v22 - v19 <= 0.0)
        goto LABEL_22;
      -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v18 - v17, v10, &v54, v19, v22 - v19, v46);
      v17 = v18 - 1;
LABEL_23:
      v56 = v57;
      v21 = v28;
      v14 = v29;
      v19 = v22;
LABEL_34:
      if (v16 == ++v18)
        goto LABEL_39;
    }
    v28 = v21;
    v29 = v14;
LABEL_22:
    v22 = v19;
    goto LABEL_23;
  }
  v16 = 0;
  v17 = 0;
  v20 = 0.0;
  v19 = 0.0;
LABEL_39:
  if ((uint64_t)(v16 + ~v17) >= 1)
    -[AKTSDBrushStroke brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:](self, "brushPath:withScaling:inElementRange:into:sectionIndex:viewScale:", v6, v17, v19, v20 - v19, v46);
  CGContextAddPath(a4, (CGPathRef)objc_msgSend(v10, "CGPath"));
  -[AKTSDBrushStroke color](self, "color");
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(v44, "CGColor"));

  CGContextFillPath(a4);
  _Block_object_dispose(&v50, 8);

}

- (NSString)strokeName
{
  return self->_strokeName;
}

- (UIColor)color
{
  return self->_color;
}

- (double)width
{
  return self->_width;
}

- (int)join
{
  return self->_join;
}

- (double)miterLimit
{
  return self->_miterLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_strokeName, 0);
}

@end
