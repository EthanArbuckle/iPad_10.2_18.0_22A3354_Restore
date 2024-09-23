@implementation UIImage

+ (id)_phImageNamed:(id)a3 inBundle:(id)a4 compatibleWithTraitCollection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v8, v9));

  return v10;
}

+ (id)phImageNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _phImageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "_phImageNamed:inBundle:compatibleWithTraitCollection:", v3, 0, v5));

  return v6;
}

+ (id)phCarPlayImageNamed:(id)a3
{
  return objc_msgSend(a1, "phCarPlayImageNamed:inBundle:", a3, 0);
}

+ (id)phCarPlayImageNamed:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen _carScreen](UIScreen, "_carScreen"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _phImageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "_phImageNamed:inBundle:compatibleWithTraitCollection:", v6, v5, v8));

  return v9;
}

+ (id)phPathForImageNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage phPathForImageNamed:inBundle:](UIImage, "phPathForImageNamed:inBundle:", v3, v4));

  return v5;
}

+ (id)phPathForImageNamed:(id)a3 inBundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  v9 = v8;

  if (v9 <= 1.0)
    goto LABEL_7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%dx"), (int)v11));

  if (objc_msgSend(v5, "hasSuffix:", v12))
  {

LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", v5, CFSTR("png")));
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathForResource:ofType:", v13, CFSTR("png")));

  if (!v14)
    goto LABEL_7;
LABEL_8:

  return v14;
}

@end
