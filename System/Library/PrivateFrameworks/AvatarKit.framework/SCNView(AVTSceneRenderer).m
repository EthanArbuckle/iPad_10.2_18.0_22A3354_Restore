@implementation SCNView(AVTSceneRenderer)

- (__n64)avt_simdProjectPoint:()AVTSceneRenderer
{
  unsigned __int32 v4;
  __n64 result;

  LODWORD(a3) = a2.n128_u32[1];
  LODWORD(a4) = a2.n128_u32[2];
  objc_msgSend(a1, "projectPoint:", a2.n128_f64[0], a3, a4);
  result.n64_u32[1] = v4;
  return result;
}

- (__n64)avt_simdUnprojectPoint:()AVTSceneRenderer
{
  unsigned __int32 v4;
  __n64 result;

  LODWORD(a3) = a2.n128_u32[1];
  LODWORD(a4) = a2.n128_u32[2];
  objc_msgSend(a1, "unprojectPoint:", a2.n128_f64[0], a3, a4);
  result.n64_u32[1] = v4;
  return result;
}

@end
