@implementation _FEFocusRegionDebugQuickLook

+ (void)drawDebugQuickLookImageForRegion:(id)a3 withInfo:(id)a4 inContext:(CGContext *)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "_debugDrawingConfigurationWithDebugInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapshotFrameForRegion:", v9);

  }
}

@end
