@implementation NSValue(CAPoint3DAdditions)

- (double)CAPoint3DValue
{
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  memset(v2, 0, 24);
  objc_msgSend(a1, "getValue:size:", v2, 24);
  return *(double *)v2;
}

+ (uint64_t)valueWithCAPoint3D:()CAPoint3DAdditions
{
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  return objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{CAPoint3D=ddd}");
}

@end
