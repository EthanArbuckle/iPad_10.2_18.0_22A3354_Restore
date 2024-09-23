@implementation NSBundle

void __42__NSBundle_MPAdditions__mediaPlayerBundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", NSClassFromString(CFSTR("MPNowPlayingInfoCenter")));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)mediaPlayerBundle___mediaPlayerBundle;
  mediaPlayerBundle___mediaPlayerBundle = v2;

  if (!mediaPlayerBundle___mediaPlayerBundle)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("NSBundle_MPAdditions.m"), 18, CFSTR("unable to find MediaPlayer bundle"));

  }
}

@end
