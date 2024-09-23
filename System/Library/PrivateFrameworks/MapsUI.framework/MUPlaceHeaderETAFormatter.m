@implementation MUPlaceHeaderETAFormatter

+ (id)etaStringFromSeconds:(unint64_t)a3 isRenderingInFullWidth:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E0CB3940], "_navigation_stringWithSeconds:andAbbreviationType:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
