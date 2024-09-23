@implementation CAMCounterRotatingLayer

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("transform")))
  {
    v8 = v6;
    if (objc_msgSend(v8, "isAdditive"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v8, "fromValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "CATransform3DValue");
      }
      else
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
      }

      v11 = atan2(*((long double *)&v14 + 1), *(long double *)&v14);
      objc_msgSend(v8, "setKeyPath:", CFSTR("transform.rotation.z"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFromValue:", v12);

      objc_msgSend(v8, "setToValue:", &unk_1EA3AFFB0);
    }

  }
  v13.receiver = self;
  v13.super_class = (Class)CAMCounterRotatingLayer;
  -[CAMCounterRotatingLayer addAnimation:forKey:](&v13, sel_addAnimation_forKey_, v6, v7);

}

@end
