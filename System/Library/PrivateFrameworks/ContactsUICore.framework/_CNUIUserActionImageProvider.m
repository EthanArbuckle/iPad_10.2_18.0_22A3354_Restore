@implementation _CNUIUserActionImageProvider

+ (id)symbolOulinedImageNameForActionType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96618]) & 1) != 0)
  {
    v4 = CFSTR("envelope");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v4 = CFSTR("message");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96658]) & 1) != 0)
  {
    v4 = CFSTR("video");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C965F8]) & 1) != 0)
  {
    v4 = CFSTR("phone");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96630]) & 1) != 0)
  {
    v4 = CFSTR("applepaycash");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96608]) & 1) != 0)
  {
    v4 = CFSTR("arrow.triangle.turn.up.right.circle");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96638]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96648]) & 1) != 0)
  {
    v4 = CFSTR("teletype");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96610]))
  {
    v4 = CFSTR("rectangle.on.rectangle");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

+ (id)symbolImageNameForActionType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96618]) & 1) != 0)
  {
    v4 = CFSTR("envelope.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v4 = CFSTR("message.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96658]) & 1) != 0)
  {
    v4 = CFSTR("video.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C965F8]) & 1) != 0)
  {
    v4 = CFSTR("phone.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96630]) & 1) != 0)
  {
    v4 = CFSTR("applepaycash");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96608]) & 1) != 0)
  {
    v4 = CFSTR("arrow.triangle.turn.up.right.circle.fill");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96638]) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96648]) & 1) != 0)
  {
    v4 = CFSTR("teletype");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96610]))
  {
    v4 = CFSTR("rectangle.fill.on.rectangle.fill");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

+ (id)imageForActionType:(id)a3 imageStyle:(int64_t)a4
{
  void *v4;
  void *v5;

  +[_CNUIUserActionImageProvider symbolImageNameForActionType:](_CNUIUserActionImageProvider, "symbolImageNameForActionType:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "preferredSymbolImageNamed:size:compatibleWithTextStyle:", v4, *MEMORY[0x1E0CEB700], *MEMORY[0x1E0CEB538]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)imageResourceNameForActionType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96618]) & 1) != 0)
  {
    v4 = CFSTR("EmailActionGlyphTemplate");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v4 = CFSTR("TextActionGlyphTemplate");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96658]) & 1) != 0)
  {
    v4 = CFSTR("VideoActionGlyphTemplate");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C965F8]) & 1) != 0)
  {
    v4 = CFSTR("VoiceActionGlyphTemplate");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96630]) & 1) != 0)
  {
    v4 = CFSTR("PayActionGlyphTemplate");
  }
  else
  {
    v4 = CFSTR("DirectionsActionGlyphTemplate");
    if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96608]) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96610]))
    {
      v4 = 0;
    }
  }

  return (id)v4;
}

@end
