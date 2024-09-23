@implementation STKStickerPickerSceneSpecification

- (id)userActivity
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1960]), "initWithActivityType:", CFSTR("STKStickerPickerActivityTypeDefaultBrowser"));
}

@end
