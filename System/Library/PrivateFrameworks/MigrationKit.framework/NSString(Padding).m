@implementation NSString(Padding)

- (id)padLeftToLength:()Padding withString:
{
  id v6;
  int v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = objc_msgSend(a1, "length");
  if (a3 - v7 < 0)
  {
    v9 = a1;
  }
  else
  {
    objc_msgSend(&stru_24E35A3B8, "stringByPaddingToLength:withString:startingAtIndex:", (a3 - v7), v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v8, a1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (uint64_t)padRightToLength:()Padding withString:
{
  return objc_msgSend(a1, "stringByPaddingToLength:withString:startingAtIndex:", a3, a4, 0);
}

- (id)padToLength:()Padding withString:
{
  id v6;
  double v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (double)a3 * 0.5 - (double)(unint64_t)objc_msgSend(a1, "length") * 0.5;
  if (v7 >= 0.0)
  {
    objc_msgSend(&stru_24E35A3B8, "stringByPaddingToLength:withString:startingAtIndex:", vcvtmd_u64_f64(v7), v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_24E35A3B8, "stringByPaddingToLength:withString:startingAtIndex:", vcvtpd_u64_f64(v7), v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v9, a1, v10);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

@end
