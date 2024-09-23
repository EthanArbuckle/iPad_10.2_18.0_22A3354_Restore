@implementation INConnectedCall

- (INConnectedCall)initWithAudioRoute:(int64_t)a3
{
  INConnectedCall *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INConnectedCall;
  result = -[INConnectedCall init](&v5, sel_init);
  if (result)
    result->_audioRoute = a3;
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_audioRoute);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  INConnectedCall *v4;
  BOOL v5;

  v4 = (INConnectedCall *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_audioRoute == v4->_audioRoute;
  }

  return v5;
}

- (INConnectedCall)initWithCoder:(id)a3
{
  return -[INConnectedCall initWithAudioRoute:](self, "initWithAudioRoute:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("audioRoute")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_audioRoute, CFSTR("audioRoute"));
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  int64_t audioRoute;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  audioRoute = self->_audioRoute;
  v7 = CFSTR("heySiriAudioRoute");
  v8 = CFSTR("unknown");
  if (audioRoute == 2)
    v8 = CFSTR("bluetoothAudioRoute");
  if (audioRoute != 1000)
    v7 = v8;
  if (audioRoute == 1)
    v9 = CFSTR("speakerphoneAudioRoute");
  else
    v9 = (__CFString *)v7;
  v10 = v9;
  objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v10, CFSTR("audioRoute"));

  return v5;
}

- (NSString)description
{
  return (NSString *)-[INConnectedCall descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INConnectedCall;
  -[INConnectedCall description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INConnectedCall _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("audioRoute");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_audioRoute);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)audioRoute
{
  return self->_audioRoute;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("audioRoute"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = INCallAudioRouteWithString(v7);

    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAudioRoute:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
