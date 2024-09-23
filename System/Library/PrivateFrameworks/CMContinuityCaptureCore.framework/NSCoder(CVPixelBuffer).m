@implementation NSCoder(CVPixelBuffer)

- (CFTypeRef)decodeCVPixelBufferForKey:()CVPixelBuffer
{
  id v4;
  void *v5;
  CFTypeRef v6;
  CFTypeRef v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "pixelBuffer"))
  {
    v6 = CFRetain((CFTypeRef)objc_msgSend(v5, "pixelBuffer"));
    v7 = CFAutorelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CFTypeRef)decodeCVPixelBufferForKey:()CVPixelBuffer expectSourceMedia:
{
  id v6;
  void *v7;
  CFTypeRef v8;
  CFTypeRef v9;

  v6 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && objc_msgSend(v7, "pixelBuffer"))
    objc_msgSend(v7, "transferSourceMedia");
  if (objc_msgSend(v7, "pixelBuffer"))
  {
    v8 = CFRetain((CFTypeRef)objc_msgSend(v7, "pixelBuffer"));
    v9 = CFAutorelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeCVPixelBuffer:()CVPixelBuffer forKey:
{
  CVPixelBufferCoder *v6;
  id v7;

  v7 = a4;
  v6 = -[CVPixelBufferCoder initWithCVPixelBuffer:]([CVPixelBufferCoder alloc], "initWithCVPixelBuffer:", a3);
  if (v6)
    objc_msgSend(a1, "encodeObject:forKey:", v6, v7);

}

@end
