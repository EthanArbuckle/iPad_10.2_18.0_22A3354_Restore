@implementation MKAnimatedTileOverlay

void __77___MKAnimatedTileOverlay_CustomLoading__loadTileAtPath_keyframeIndex_result___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
    NSLog(CFSTR("%@: Error loading URL %@: %@"), a1[4], a1[5], v8);
  (*(void (**)(void))(a1[6] + 16))();

}

@end
