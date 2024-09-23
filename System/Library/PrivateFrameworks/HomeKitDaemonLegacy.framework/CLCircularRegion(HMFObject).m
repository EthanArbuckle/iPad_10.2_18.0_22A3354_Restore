@implementation CLCircularRegion(HMFObject)

- (id)description
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1EFB71E10;
  objc_msgSendSuper2(&v2, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)attributeDescriptions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28680], "defaultFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "center");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:options:formatter:", CFSTR("Lat"), v5, 0, v2);
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "center", v6);
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithName:value:options:formatter:", CFSTR("Long"), v10, 0, v2);
  v18[1] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "radius");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithName:value:options:formatter:", CFSTR("R"), v14, 0, v2);
  v18[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
