@implementation SKGlobalSharedContextRegistry

+ (void)setGlobalMetalDevice:(id)a3
{
  objc_storeStrong((id *)&_metalDevice, a3);
}

+ (void)setPrefersOpenGL:(BOOL)a3
{
  SKSetPrefersOpenGL(a3);
}

+ (id)globalGLSharedContext
{
  SKEnsureGlobalGLShareContext();
  return (id)_glShareContext;
}

+ (void)setGlobalGLSharedContext:(id)a3
{
  objc_storeStrong((id *)&_glShareContext, a3);
}

+ (id)globalMetalDevice
{
  SKEnsureGlobalMetalDevice();
  return (id)_metalDevice;
}

@end
