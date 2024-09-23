@implementation INRestaurantGuestDisplayPreferences

- (INRestaurantGuestDisplayPreferences)init
{
  INRestaurantGuestDisplayPreferences *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INRestaurantGuestDisplayPreferences;
  result = -[INRestaurantGuestDisplayPreferences init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_nameFieldFirstNameOptional = 0;
    *(_DWORD *)&result->_nameFieldShouldBeDisplayed = 16843009;
    *(_WORD *)&result->_emailAddressEditable = 257;
  }
  return result;
}

- (INRestaurantGuestDisplayPreferences)initWithCoder:(id)a3
{
  id v4;
  INRestaurantGuestDisplayPreferences *v5;

  v4 = a3;
  v5 = -[INRestaurantGuestDisplayPreferences init](self, "init");
  if (v5)
  {
    v5->_nameFieldFirstNameOptional = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nameFieldFirstNameOptional"));
    v5->_nameFieldLastNameOptional = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nameFieldLastNameOptional"));
    v5->_nameFieldShouldBeDisplayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nameFieldShouldBeDisplayed"));
    v5->_emailAddressFieldShouldBeDisplayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emailAddressFieldShouldBeDisplayed"));
    v5->_phoneNumberFieldShouldBeDisplayed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("phoneNumberFieldShouldBeDisplayed"));
    v5->_nameEditable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nameEditable"));
    v5->_emailAddressEditable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emailAddressEditable"));
    v5->_phoneNumberEditable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("phoneNumberEditable"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 nameFieldFirstNameOptional;
  id v5;

  nameFieldFirstNameOptional = self->_nameFieldFirstNameOptional;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", nameFieldFirstNameOptional, CFSTR("nameFieldFirstNameOptional"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_nameFieldLastNameOptional, CFSTR("nameFieldLastNameOptional"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_nameFieldShouldBeDisplayed, CFSTR("nameFieldShouldBeDisplayed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_emailAddressFieldShouldBeDisplayed, CFSTR("emailAddressFieldShouldBeDisplayed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_phoneNumberFieldShouldBeDisplayed, CFSTR("phoneNumberFieldShouldBeDisplayed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_nameEditable, CFSTR("nameEditable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_emailAddressEditable, CFSTR("emailAddressEditable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_phoneNumberEditable, CFSTR("phoneNumberEditable"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  INRestaurantGuestDisplayPreferences *v4;

  v4 = -[INRestaurantGuestDisplayPreferences init](+[INRestaurantGuestDisplayPreferences allocWithZone:](INRestaurantGuestDisplayPreferences, "allocWithZone:", a3), "init");
  -[INRestaurantGuestDisplayPreferences setNameFieldFirstNameOptional:](v4, "setNameFieldFirstNameOptional:", -[INRestaurantGuestDisplayPreferences nameFieldFirstNameOptional](self, "nameFieldFirstNameOptional"));
  -[INRestaurantGuestDisplayPreferences setNameFieldLastNameOptional:](v4, "setNameFieldLastNameOptional:", -[INRestaurantGuestDisplayPreferences nameFieldLastNameOptional](self, "nameFieldLastNameOptional"));
  -[INRestaurantGuestDisplayPreferences setNameFieldShouldBeDisplayed:](v4, "setNameFieldShouldBeDisplayed:", -[INRestaurantGuestDisplayPreferences nameFieldShouldBeDisplayed](self, "nameFieldShouldBeDisplayed"));
  -[INRestaurantGuestDisplayPreferences setEmailAddressFieldShouldBeDisplayed:](v4, "setEmailAddressFieldShouldBeDisplayed:", -[INRestaurantGuestDisplayPreferences emailAddressFieldShouldBeDisplayed](self, "emailAddressFieldShouldBeDisplayed"));
  -[INRestaurantGuestDisplayPreferences setPhoneNumberFieldShouldBeDisplayed:](v4, "setPhoneNumberFieldShouldBeDisplayed:", -[INRestaurantGuestDisplayPreferences phoneNumberFieldShouldBeDisplayed](self, "phoneNumberFieldShouldBeDisplayed"));
  -[INRestaurantGuestDisplayPreferences setNameEditable:](v4, "setNameEditable:", -[INRestaurantGuestDisplayPreferences nameEditable](self, "nameEditable"));
  -[INRestaurantGuestDisplayPreferences setEmailAddressEditable:](v4, "setEmailAddressEditable:", -[INRestaurantGuestDisplayPreferences emailAddressEditable](self, "emailAddressEditable"));
  -[INRestaurantGuestDisplayPreferences setPhoneNumberEditable:](v4, "setPhoneNumberEditable:", -[INRestaurantGuestDisplayPreferences phoneNumberEditable](self, "phoneNumberEditable"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  INRestaurantGuestDisplayPreferences *v4;
  INRestaurantGuestDisplayPreferences *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v15;

  v4 = (INRestaurantGuestDisplayPreferences *)a3;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[INRestaurantGuestDisplayPreferences nameFieldFirstNameOptional](v5, "nameFieldFirstNameOptional");
      if (v6 == -[INRestaurantGuestDisplayPreferences nameFieldFirstNameOptional](self, "nameFieldFirstNameOptional")
        && (v7 = -[INRestaurantGuestDisplayPreferences nameFieldLastNameOptional](v5, "nameFieldLastNameOptional"),
            v7 == -[INRestaurantGuestDisplayPreferences nameFieldLastNameOptional](self, "nameFieldLastNameOptional"))
        && (v8 = -[INRestaurantGuestDisplayPreferences nameFieldShouldBeDisplayed](v5, "nameFieldShouldBeDisplayed"),
            v8 == -[INRestaurantGuestDisplayPreferences nameFieldShouldBeDisplayed](self, "nameFieldShouldBeDisplayed"))
        && (v9 = -[INRestaurantGuestDisplayPreferences emailAddressFieldShouldBeDisplayed](v5, "emailAddressFieldShouldBeDisplayed"), v9 == -[INRestaurantGuestDisplayPreferences emailAddressFieldShouldBeDisplayed](self, "emailAddressFieldShouldBeDisplayed"))&& (v10 = -[INRestaurantGuestDisplayPreferences phoneNumberFieldShouldBeDisplayed](v5, "phoneNumberFieldShouldBeDisplayed"), v10 == -[INRestaurantGuestDisplayPreferences phoneNumberFieldShouldBeDisplayed](self, "phoneNumberFieldShouldBeDisplayed"))&& (v11 = -[INRestaurantGuestDisplayPreferences nameEditable](v5, "nameEditable"), v11 == -[INRestaurantGuestDisplayPreferences nameEditable](self, "nameEditable"))&& (v12 = -[INRestaurantGuestDisplayPreferences emailAddressEditable](v5, "emailAddressEditable"), v12 == -[INRestaurantGuestDisplayPreferences emailAddressEditable](self, "emailAddressEditable")))
      {
        v15 = -[INRestaurantGuestDisplayPreferences phoneNumberEditable](v5, "phoneNumberEditable");
        v13 = v15 ^ -[INRestaurantGuestDisplayPreferences phoneNumberEditable](self, "phoneNumberEditable") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (NSString)description
{
  return (NSString *)-[INRestaurantGuestDisplayPreferences descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantGuestDisplayPreferences;
  -[INRestaurantGuestDisplayPreferences description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRestaurantGuestDisplayPreferences _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("nameFieldFirstNameOptional");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nameFieldFirstNameOptional);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("nameFieldLastNameOptional");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nameFieldLastNameOptional);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("nameFieldShouldBeDisplayed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nameFieldShouldBeDisplayed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("emailAddressFieldShouldBeDisplayed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_emailAddressFieldShouldBeDisplayed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("phoneNumberFieldShouldBeDisplayed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_phoneNumberFieldShouldBeDisplayed);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("nameEditable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nameEditable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("emailAddressEditable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_emailAddressEditable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("phoneNumberEditable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_phoneNumberEditable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)nameFieldFirstNameOptional
{
  return self->_nameFieldFirstNameOptional;
}

- (void)setNameFieldFirstNameOptional:(BOOL)nameFieldFirstNameOptional
{
  self->_nameFieldFirstNameOptional = nameFieldFirstNameOptional;
}

- (BOOL)nameFieldLastNameOptional
{
  return self->_nameFieldLastNameOptional;
}

- (void)setNameFieldLastNameOptional:(BOOL)nameFieldLastNameOptional
{
  self->_nameFieldLastNameOptional = nameFieldLastNameOptional;
}

- (BOOL)nameFieldShouldBeDisplayed
{
  return self->_nameFieldShouldBeDisplayed;
}

- (void)setNameFieldShouldBeDisplayed:(BOOL)nameFieldShouldBeDisplayed
{
  self->_nameFieldShouldBeDisplayed = nameFieldShouldBeDisplayed;
}

- (BOOL)emailAddressFieldShouldBeDisplayed
{
  return self->_emailAddressFieldShouldBeDisplayed;
}

- (void)setEmailAddressFieldShouldBeDisplayed:(BOOL)emailAddressFieldShouldBeDisplayed
{
  self->_emailAddressFieldShouldBeDisplayed = emailAddressFieldShouldBeDisplayed;
}

- (BOOL)phoneNumberFieldShouldBeDisplayed
{
  return self->_phoneNumberFieldShouldBeDisplayed;
}

- (void)setPhoneNumberFieldShouldBeDisplayed:(BOOL)phoneNumberFieldShouldBeDisplayed
{
  self->_phoneNumberFieldShouldBeDisplayed = phoneNumberFieldShouldBeDisplayed;
}

- (BOOL)nameEditable
{
  return self->_nameEditable;
}

- (void)setNameEditable:(BOOL)nameEditable
{
  self->_nameEditable = nameEditable;
}

- (BOOL)emailAddressEditable
{
  return self->_emailAddressEditable;
}

- (void)setEmailAddressEditable:(BOOL)emailAddressEditable
{
  self->_emailAddressEditable = emailAddressEditable;
}

- (BOOL)phoneNumberEditable
{
  return self->_phoneNumberEditable;
}

- (void)setPhoneNumberEditable:(BOOL)phoneNumberEditable
{
  self->_phoneNumberEditable = phoneNumberEditable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
