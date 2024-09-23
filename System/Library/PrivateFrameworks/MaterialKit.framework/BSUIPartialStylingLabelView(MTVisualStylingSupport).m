@implementation BSUIPartialStylingLabelView(MTVisualStylingSupport)

- (void)mt_applyVisualStyling:()MTVisualStylingSupport
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  objc_msgSend(a1, "contentLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__BSUIPartialStylingLabelView_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke;
  v6[3] = &unk_24C3DBA90;
  v6[4] = a1;
  objc_msgSend(v4, "applyToView:withColorBlock:", v5, v6);

}

- (void)mt_removeAllVisualStyling
{
  id v1;

  objc_msgSend(a1, "contentLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mt_removeAllVisualStyling");

}

@end
