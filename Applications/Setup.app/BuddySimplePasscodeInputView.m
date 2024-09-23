@implementation BuddySimplePasscodeInputView

- (BuddySimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4
{
  BuddyPasscodeField *v4;
  BuddyPasscodeField *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSArray *v16;
  BuddySimplePasscodeInputView *v17;
  id v19;
  id v20;
  id v21;
  objc_super v22;
  unint64_t v23;
  SEL v24;
  id location;
  CGRect v26;
  _QWORD v27[4];

  v26 = a3;
  v24 = a2;
  v23 = a4;
  location = 0;
  v22.receiver = self;
  v22.super_class = (Class)BuddySimplePasscodeInputView;
  location = -[BuddySimplePasscodeInputView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v4 = [BuddyPasscodeField alloc];
    v5 = -[BuddyPasscodeField initWithNumberOfEntryFields:](v4, "initWithNumberOfEntryFields:", v23);
    v6 = (void *)*((_QWORD *)location + 3);
    *((_QWORD *)location + 3) = v5;

    objc_msgSend(*((id *)location + 3), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)location + 3), "setDelegate:", location);
    objc_msgSend(location, "addSubview:", *((_QWORD *)location + 3));
    v21 = objc_msgSend(*((id *)location + 3), "leadingAnchor");
    v20 = objc_msgSend(location, "leadingAnchor");
    v19 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v27[0] = v19;
    v7 = objc_msgSend(*((id *)location + 3), "trailingAnchor");
    v8 = objc_msgSend(location, "trailingAnchor");
    v9 = objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v27[1] = v9;
    v10 = objc_msgSend(*((id *)location + 3), "topAnchor");
    v11 = objc_msgSend(location, "topAnchor");
    v12 = objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v27[2] = v12;
    v13 = objc_msgSend(*((id *)location + 3), "bottomAnchor");
    v14 = objc_msgSend(location, "bottomAnchor");
    v15 = objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  v17 = (BuddySimplePasscodeInputView *)location;
  objc_storeStrong(&location, 0);
  return v17;
}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  BuddyPasscodeField *v3;
  id location[2];
  BuddySimplePasscodeInputView *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddySimplePasscodeInputView passcodeField](v5, "passcodeField");
  -[BuddyPasscodeField setStringValue:](v3, "setStringValue:", location[0]);

  objc_storeStrong(location, 0);
}

- (id)passcode
{
  BuddyPasscodeField *v2;
  NSString *v3;

  v2 = -[BuddySimplePasscodeInputView passcodeField](self, "passcodeField", a2, self);
  v3 = -[BuddyPasscodeField stringValue](v2, "stringValue");

  return v3;
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  BuddyPasscodeInputViewDelegate *v5;
  char v6;
  BuddyPasscodeInputViewDelegate *v7;
  char v8;
  BuddyPasscodeInputViewDelegate *v9;
  id v10;
  id location[2];
  BuddySimplePasscodeInputView *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v5 = -[BuddyPasscodeInputView delegate](v12, "delegate");
  v8 = 0;
  v6 = 0;
  if (v5)
  {
    v9 = -[BuddyPasscodeInputView delegate](v12, "delegate");
    v8 = 1;
    v6 = objc_opt_respondsToSelector(v9, "passcodeInput:enteredPasscode:");
  }
  if ((v8 & 1) != 0)

  if ((v6 & 1) != 0)
  {
    v7 = -[BuddyPasscodeInputView delegate](v12, "delegate");
    -[BuddyPasscodeInputViewDelegate passcodeInput:enteredPasscode:](v7, "passcodeInput:enteredPasscode:", v12, v10);

  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)limitCharactersToNumbers
{
  return self->_limitCharactersToNumbers;
}

- (void)setLimitCharactersToNumbers:(BOOL)a3
{
  self->_limitCharactersToNumbers = a3;
}

- (BuddyPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end
