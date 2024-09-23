@implementation PBCodable(MRAdditions)

- (id)mr_valueForPotentiallyUndefinedKey:()MRAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  id v10;
  void (**v11)(_QWORD);
  SEL v12;
  unsigned int (*v13)(void *, SEL);
  void *v14;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "substringToIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("has%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__PBCodable_MRAdditions__mr_valueForPotentiallyUndefinedKey___block_invoke;
  v16[3] = &unk_1E30C8670;
  v16[4] = a1;
  v17 = v4;
  v10 = v4;
  v11 = (void (**)(_QWORD))MEMORY[0x194036C44](v16);
  v12 = NSSelectorFromString(v9);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v13 = (unsigned int (*)(void *, SEL))objc_msgSend(a1, "methodForSelector:", v12)) != 0
    && v13(a1, v12))
  {
    v11[2](v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
