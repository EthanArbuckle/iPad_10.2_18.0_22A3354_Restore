@implementation STKDeclarations

+ (void)setStickerEffectType:(unint64_t)a3 onSticker:(id)a4
{
  objc_msgSend(a4, "setStickerEffectType:", a3);
}

+ (void)setIsAppInstallationAvailable:(BOOL)a3 forBalloonPluginManager:(id)a4
{
  objc_msgSend(a4, "setIsAppInstallationEnabled:", a3);
}

+ (id)appFromBalloonPlugin:(id)a3
{
  return (id)objc_msgSend(a3, "app");
}

@end
