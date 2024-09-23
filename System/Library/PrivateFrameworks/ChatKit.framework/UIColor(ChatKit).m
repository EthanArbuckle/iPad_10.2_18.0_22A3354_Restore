@implementation UIColor(ChatKit)

- (double)ckColor
{
  __int128 v2;
  __int128 v3;

  v2 = CKColorZero;
  v3 = *(_OWORD *)&qword_18E7CB368;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v2, (char *)&v2 + 8, &v3, (char *)&v3 + 8);
  return *(double *)&v2;
}

+ (uint64_t)ck_colorWithCKColor:()ChatKit
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:");
}

@end
