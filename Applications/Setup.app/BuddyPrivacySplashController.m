@implementation BuddyPrivacySplashController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id location;
  objc_super v9;
  SEL v10;
  BuddyPrivacySplashController *v11;
  _QWORD v12[5];

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)BuddyPrivacySplashController;
  -[BuddyPrivacySplashController viewDidLoad](&v9, "viewDidLoad");
  v2 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Fade up"), CFSTR("Fade up Dark"), 0.1, 1.0);
  v12[0] = v2;
  v3 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Shake up"), CFSTR("Shake up Dark"), 0.5, 0.5);
  v12[1] = v3;
  v4 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Shake down"), CFSTR("Shake down Dark"), 0.5, 0.5);
  v12[2] = v4;
  v5 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Shake up"), CFSTR("Shake up Dark"), 0.5, 0.5);
  v12[3] = v5;
  v6 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Shake down"), CFSTR("Shake down Dark"), 0.5, 0.5);
  v12[4] = v6;
  location = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 5);

  v7 = -[BuddyPrivacySplashController buddy_animationController:animatedStates:startAtFirstState:](v11, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("PrivacyPane"), location, 1);
  -[BuddyPrivacySplashController setAnimationController:](v11, "setAnimationController:", v7);

  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  OBAnimationController *v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  BuddyPrivacySplashController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPrivacySplashController;
  -[BuddyPrivacySplashController viewWillAppear:](&v4, "viewWillAppear:", a3);
  v3 = -[BuddyPrivacySplashController animationController](v7, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
}

@end
