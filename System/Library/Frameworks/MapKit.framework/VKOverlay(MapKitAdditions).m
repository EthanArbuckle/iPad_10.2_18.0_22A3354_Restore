@implementation VKOverlay(MapKitAdditions)

+ (id)overlayWithDrawable:()MapKitAdditions forOverlay:atLevel:
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0DC6530]);
  objc_msgSend(v9, "setDelegate:", v7);
  if (a5 <= 1)
    objc_msgSend(v9, "setLevel:", a5);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "canReplaceMapContent"))
  {
    objc_msgSend(v8, "boundingMapRect");
    objc_msgSend(v9, "setReplaceMapContentInRect:");
  }
  objc_msgSend(v7, "set_renderer:", v9);

  return v9;
}

@end
