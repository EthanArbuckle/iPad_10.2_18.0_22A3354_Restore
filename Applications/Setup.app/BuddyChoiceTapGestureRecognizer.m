@implementation BuddyChoiceTapGestureRecognizer

- (BuddyChoiceTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 choice:(id)a5
{
  id v7;
  BuddyChoiceTapGestureRecognizer *v8;
  BuddyChoiceTapGestureRecognizer *v9;
  objc_super v11;
  id obj;
  SEL v13;
  id location[2];
  id v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  obj = 0;
  objc_storeStrong(&obj, a5);
  v7 = v15;
  v15 = 0;
  v11.receiver = v7;
  v11.super_class = (Class)BuddyChoiceTapGestureRecognizer;
  v8 = -[BuddyChoiceTapGestureRecognizer initWithTarget:action:](&v11, "initWithTarget:action:", location[0], v13);
  v15 = v8;
  objc_storeStrong(&v15, v8);
  if (v8)
    objc_storeStrong((id *)v15 + 1, obj);
  v9 = (BuddyChoiceTapGestureRecognizer *)v15;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v15, 0);
  return v9;
}

- (BuddyChoice)buddyChoice
{
  return self->_buddyChoice;
}

- (void)setBuddyChoice:(id)a3
{
  objc_storeStrong((id *)&self->_buddyChoice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buddyChoice, 0);
}

@end
