@implementation NSObject(SCN_DisplayLinkExtensions)

- (SCNDisplayLink)SCN_setupDisplayLinkWithQueue:()SCN_DisplayLinkExtensions screen:policy:
{
  id v8;
  id v9;
  SCNDisplayLink *v10;
  SCNDisplayLink *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, a1);
  v10 = [SCNDisplayLink alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__NSObject_SCN_DisplayLinkExtensions__SCN_setupDisplayLinkWithQueue_screen_policy___block_invoke;
  v13[3] = &unk_1EA5A0BB8;
  objc_copyWeak(&v14, &location);
  v11 = -[SCNDisplayLink initWithQueue:screen:policy:block:](v10, "initWithQueue:screen:policy:block:", v8, v9, a5, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

@end
