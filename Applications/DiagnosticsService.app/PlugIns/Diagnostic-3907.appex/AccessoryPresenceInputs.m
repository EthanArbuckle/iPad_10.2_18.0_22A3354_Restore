@implementation AccessoryPresenceInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("USB"), CFSTR("MiniJack"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("identifier"), v5, &v8));

  -[AccessoryPresenceInputs setIdentifier:](self, "setIdentifier:", v6);
  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  void *v8;
  char v10;

  v10 = 0;
  v4 = a3;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:", CFSTR("accessoryModelNumbers"), v6, 100, &__NSArray0__struct, &v10));
  -[AccessoryPresenceInputs setModelNumbers:](self, "setModelNumbers:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("timeOut"), &off_100004258, &off_100004270, &off_100004258, &v10));
  -[AccessoryPresenceInputs setTimeout:](self, "setTimeout:", objc_msgSend(v8, "integerValue"));

  return v10 == 0;
}

- (NSArray)modelNumbers
{
  return self->_modelNumbers;
}

- (void)setModelNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_modelNumbers, a3);
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modelNumbers, 0);
}

@end
