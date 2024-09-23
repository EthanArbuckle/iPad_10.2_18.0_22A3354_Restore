@implementation SFDeviceSupportsWebKitFullscreenAPI

void ___SFDeviceSupportsWebKitFullscreenAPI_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v0 == 1)
  {
    _SFDeviceSupportsWebKitFullscreenAPI::supportsFullscreen = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v1)
    {
      _SFDeviceSupportsWebKitFullscreenAPI::supportsFullscreen = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      _SFDeviceSupportsWebKitFullscreenAPI::supportsFullscreen = objc_msgSend(v4, "BOOLForKey:", CFSTR("EnableFullScreenAPIOnPhone"));

    }
  }
}

@end
