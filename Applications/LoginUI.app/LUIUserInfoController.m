@implementation LUIUserInfoController

+ (id)sharedController
{
  if (qword_100088CD0 != -1)
    dispatch_once(&qword_100088CD0, &stru_100068CE8);
  return (id)qword_100088CC8;
}

- (void)presentUserInfoForUser:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[LUIPopUpController sharedInstance](LUIPopUpController, "sharedInstance"));
  objc_msgSend(v4, "showPopUp:forUser:completionHandler:", 2, v3, 0);

}

@end
