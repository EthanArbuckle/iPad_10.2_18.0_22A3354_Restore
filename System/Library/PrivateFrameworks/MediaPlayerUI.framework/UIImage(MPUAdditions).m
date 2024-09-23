@implementation UIImage(MPUAdditions)

+ (id)imageWithSize:()MPUAdditions opaque:fromBlock:
{
  void (**v9)(_QWORD);
  void *v10;
  CGSize v12;

  if (a6)
  {
    v9 = a6;
    v12.width = a1;
    v12.height = a2;
    UIGraphicsBeginImageContextWithOptions(v12, a5, 0.0);
    v9[2](v9);

    UIGraphicsGetImageFromCurrentImageContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)scaledImageWithSize:()MPUAdditions
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__UIImage_MPUAdditions__scaledImageWithSize___block_invoke;
  v4[3] = &unk_24DD2FB08;
  v4[4] = a1;
  *(double *)&v4[5] = a2;
  *(double *)&v4[6] = a3;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithSize:opaque:fromBlock:", 0, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
