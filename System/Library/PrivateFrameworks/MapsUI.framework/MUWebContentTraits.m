@implementation MUWebContentTraits

- (id)queryItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MUWebContentTraits isVibrant](self, "isVibrant"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("isVibrant"), v5);

  v7 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MUWebContentTraits isNativelyDrawingPlatter](self, "isNativelyDrawingPlatter"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("hasPlatter"), v9);

  v13[0] = v6;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isVibrant
{
  return self->_vibrant;
}

- (void)setVibrant:(BOOL)a3
{
  self->_vibrant = a3;
}

- (BOOL)isNativelyDrawingPlatter
{
  return self->_nativelyDrawingPlatter;
}

- (void)setNativelyDrawingPlatter:(BOOL)a3
{
  self->_nativelyDrawingPlatter = a3;
}

@end
