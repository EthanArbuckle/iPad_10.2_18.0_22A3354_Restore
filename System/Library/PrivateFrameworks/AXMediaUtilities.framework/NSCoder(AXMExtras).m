@implementation NSCoder(AXMExtras)

- (void)axmEncodeSize:()AXMExtras forKey:
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v9 = a2;
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = a5;
  objc_msgSend(v6, "value:withObjCType:", &v9, "{CGSize=dd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v7, *(_QWORD *)&v9, *(_QWORD *)&v10);

}

- (double)axmDecodeSizeForKey:()AXMExtras
{
  id v4;
  void *v5;
  __int128 v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v5, "getValue:size:", &v7, 16);

  return *(double *)&v7;
}

- (void)axmEncodePoint:()AXMExtras forKey:
{
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v9 = a2;
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0CB3B18];
  v7 = a5;
  objc_msgSend(v6, "value:withObjCType:", &v9, "{CGPoint=dd}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v7, *(_QWORD *)&v9, *(_QWORD *)&v10);

}

- (double)axmDecodePointForKey:()AXMExtras
{
  id v4;
  void *v5;
  __int128 v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C9D538];
  objc_msgSend(v5, "getValue:size:", &v7, 16);

  return *(double *)&v7;
}

- (void)axmEncodeRect:()AXMExtras forKey:
{
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  v9 = a7;
  objc_msgSend(v8, "value:withObjCType:", &v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v10, v9, *(_QWORD *)&v11, *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);

}

- (double)axmDecodeRectForKey:()AXMExtras
{
  id v4;
  void *v5;
  __int128 v6;
  _OWORD v8[2];

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v8[0] = *MEMORY[0x1E0C9D648];
  v8[1] = v6;
  objc_msgSend(v5, "getValue:size:", v8, 32);

  return *(double *)v8;
}

@end
