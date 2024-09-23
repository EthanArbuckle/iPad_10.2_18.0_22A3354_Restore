@implementation PKPaletteColorPickerControllerFactory

+ (id)makeColorPickerController
{
  return objc_alloc_init(PKPaletteSystemColorPickerController);
}

@end
