@implementation BuddyPasscodeField

- (BuddyPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  BuddyPasscodeField *v8;
  BuddyPasscodeFieldDot *v10;
  unint64_t i;
  id obj;
  objc_super v13;
  unint64_t v14;
  SEL v15;
  id location;

  v15 = a2;
  v14 = a3;
  location = 0;
  v13.receiver = self;
  v13.super_class = (Class)BuddyPasscodeField;
  location = -[BuddyPasscodeField initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = objc_alloc_init((Class)NSMutableString);
    v4 = (void *)*((_QWORD *)location + 4);
    *((_QWORD *)location + 4) = v3;

    *((_QWORD *)location + 3) = v14;
    *((_BYTE *)location + 8) = 1;
    obj = objc_alloc_init((Class)NSMutableArray);
    for (i = 0; i < v14; ++i)
    {
      v10 = objc_alloc_init(BuddyPasscodeFieldDot);
      -[BuddyPasscodeFieldDot setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(obj, "addObject:", v10);
      objc_msgSend(location, "addArrangedSubview:", v10);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong((id *)location + 5, obj);
    objc_msgSend(location, "setSpacing:", 28.0);
    objc_msgSend(location, "setSemanticContentAttribute:", 3);
    objc_msgSend(location, "setAccessibilityIdentifier:", CFSTR("passcodeField"));
    v5 = location;
    v6 = objc_alloc((Class)UITapGestureRecognizer);
    v7 = objc_msgSend(v6, "initWithTarget:action:", location, "_passcodeFieldTapped:");
    objc_msgSend(v5, "addGestureRecognizer:", v7);

    objc_storeStrong(&obj, 0);
  }
  v8 = (BuddyPasscodeField *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (NSString)stringValue
{
  NSMutableString *v2;
  id v3;

  v2 = -[BuddyPasscodeField value](self, "value", a2, self);
  v3 = -[NSMutableString copy](v2, "copy");

  return (NSString *)v3;
}

- (void)setStringValue:(id)a3
{
  NSMutableString *v3;
  NSMutableString *v4;
  id v5;
  id v6;
  BuddyPasscodeFieldDelegate *v7;
  BuddyPasscodeField *v8;
  NSMutableString *v9;
  id v10;
  id location[2];
  BuddyPasscodeField *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyPasscodeField value](v12, "value");
  -[NSMutableString setString:](v3, "setString:", location[0]);

  -[BuddyPasscodeField _updateDots](v12, "_updateDots");
  v4 = -[BuddyPasscodeField value](v12, "value");
  v5 = -[NSMutableString length](v4, "length");
  v6 = -[BuddyPasscodeField numberOfEntryFields](v12, "numberOfEntryFields");

  if (v5 == v6)
  {
    v7 = -[BuddyPasscodeField delegate](v12, "delegate");
    v8 = v12;
    v9 = -[BuddyPasscodeField value](v12, "value");
    v10 = -[NSMutableString copy](v9, "copy");
    -[BuddyPasscodeFieldDelegate passcodeField:enteredPasscode:](v7, "passcodeField:enteredPasscode:", v8, v10);

  }
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  NSBundle *v2;
  NSString *v3;

  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle", a2, self);
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("PASSCODE"), &stru_100284738, CFSTR("Localizable"));

  return v3;
}

- (id)accessibilityValue
{
  NSBundle *v2;
  NSString *v3;
  NSMutableString *v4;
  NSString *v5;

  v2 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v2, "localizedStringForKey:value:table:", CFSTR("PASSCODE_VALUES"), &stru_100284738, CFSTR("Localizable"));
  v4 = -[BuddyPasscodeField value](self, "value");
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, -[NSMutableString length](v4, "length"), -[BuddyPasscodeField numberOfEntryFields](self, "numberOfEntryFields"));

  return v5;
}

- (void)_passcodeFieldTapped:(id)a3
{
  id location[2];
  BuddyPasscodeField *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddyPasscodeField becomeFirstResponder](v4, "becomeFirstResponder");
  objc_storeStrong(location, 0);
}

- (void)_updateDots
{
  unint64_t v2;
  NSArray *v3;
  unint64_t v4;
  NSString *v5;
  BOOL v6;
  id v7;
  unint64_t i;
  SEL v9;
  BuddyPasscodeField *v10;

  v10 = self;
  v9 = a2;
  for (i = 0; ; ++i)
  {
    v2 = i;
    if (v2 >= -[BuddyPasscodeField numberOfEntryFields](v10, "numberOfEntryFields"))
      break;
    v3 = -[BuddyPasscodeField dotViews](v10, "dotViews");
    v7 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", i);

    v4 = i;
    v5 = -[BuddyPasscodeField stringValue](v10, "stringValue");
    v6 = v4 < -[NSString length](v5, "length");
    objc_msgSend(v7, "setFilled:", v6);

    objc_storeStrong(&v7, 0);
  }
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return -[BuddyPasscodeField isEnabled](self, "isEnabled", a2, self);
}

- (BOOL)becomeFirstResponder
{
  id v2;
  objc_super v4;
  char v5;
  SEL v6;
  BuddyPasscodeField *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPasscodeField;
  v5 = -[BuddyPasscodeField becomeFirstResponder](&v4, "becomeFirstResponder");
  if (v5)
  {
    v2 = +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    objc_msgSend(v2, "setReturnKeyEnabled:", 0);

  }
  return v5 & 1;
}

- (int64_t)keyboardType
{
  UIDevice *v2;
  id v3;

  v2 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = -[UIDevice userInterfaceIdiom](v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 11;
  else
    return 127;
}

- (BOOL)hasText
{
  NSString *v2;
  BOOL v3;

  v2 = -[BuddyPasscodeField stringValue](self, "stringValue", a2, self);
  v3 = -[NSString length](v2, "length") != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  BOOL v3;
  id v4;
  NSMutableString *v5;
  NSString *v6;
  id v7;
  id v8;
  BuddyPasscodeFieldDelegate *v9;
  BuddyPasscodeField *v10;
  NSMutableString *v11;
  id v12;
  char v13;
  NSString *v14;
  id location[2];
  BuddyPasscodeField *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  v3 = 1;
  if (-[BuddyPasscodeField isEnabled](v16, "isEnabled"))
  {
    v14 = -[BuddyPasscodeField stringValue](v16, "stringValue");
    v13 = 1;
    v4 = -[NSString length](v14, "length");
    v3 = v4 == (id)-[BuddyPasscodeField numberOfEntryFields](v16, "numberOfEntryFields");
  }
  if ((v13 & 1) != 0)

  if (!v3 && (objc_msgSend(location[0], "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    if (objc_msgSend(location[0], "length"))
    {
      v5 = -[BuddyPasscodeField value](v16, "value");
      -[NSMutableString appendString:](v5, "appendString:", location[0]);

      -[BuddyPasscodeField _updateDots](v16, "_updateDots");
      v6 = -[BuddyPasscodeField stringValue](v16, "stringValue");
      v7 = -[NSString length](v6, "length");
      v8 = -[BuddyPasscodeField numberOfEntryFields](v16, "numberOfEntryFields");

      if (v7 == v8)
      {
        v9 = -[BuddyPasscodeField delegate](v16, "delegate");
        v10 = v16;
        v11 = -[BuddyPasscodeField value](v16, "value");
        v12 = -[NSMutableString copy](v11, "copy");
        -[BuddyPasscodeFieldDelegate passcodeField:enteredPasscode:](v9, "passcodeField:enteredPasscode:", v10, v12);

      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)deleteBackward
{
  NSString *v2;
  NSUInteger v3;
  NSMutableString *v4;
  NSString *v5;
  char *v7;

  v2 = -[BuddyPasscodeField stringValue](self, "stringValue");
  v3 = -[NSString length](v2, "length");

  if (v3)
  {
    v4 = -[BuddyPasscodeField value](self, "value");
    v5 = -[BuddyPasscodeField stringValue](self, "stringValue");
    v7 = (char *)-[NSString length](v5, "length") - 1;
    -[NSMutableString deleteCharactersInRange:](v4, "deleteCharactersInRange:", v7, 1, v7, 1);

    -[BuddyPasscodeField _updateDots](self, "_updateDots");
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BuddyPasscodeFieldDelegate)delegate
{
  return (BuddyPasscodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  self->_numberOfEntryFields = a3;
}

- (NSMutableString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (void)setDotViews:(id)a3
{
  objc_storeStrong((id *)&self->_dotViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
