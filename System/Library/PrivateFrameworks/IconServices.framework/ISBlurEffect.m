@implementation ISBlurEffect

- (ISBlurEffect)initWithRadius:(double)a3
{
  ISBlurEffect *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISBlurEffect;
  result = -[ISBlurEffect init](&v5, sel_init);
  if (result)
    result->_radius = a3;
  return result;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v15[3];

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a4;
  objc_msgSend(v5, "filterWithName:", CFSTR("CIAffineClamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9E1F8];
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x1E0C9E1F8]);

  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v15[0] = *MEMORY[0x1E0C9BAA8];
  v15[1] = v9;
  v15[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v15, "{CGAffineTransform=dddddd}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, CFSTR("inputTransform"));

  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDiscBlur"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_radius);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v13, *MEMORY[0x1E0C9E258]);

  return v11;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

@end
