@implementation LUIPrivacyController

+ (id)sharedController
{
  if (qword_100088CA0 != -1)
    dispatch_once(&qword_100088CA0, &stru_100068BC0);
  return (id)qword_100088C98;
}

- (void)moreInfoButtonPressed:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[LUIPopUpController sharedInstance](LUIPopUpController, "sharedInstance", a3));
  objc_msgSend(v3, "showPopUp:forUser:completionHandler:", 1, 0, 0);

}

@end
