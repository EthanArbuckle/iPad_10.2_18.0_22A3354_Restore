@implementation MTTimerDuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MTTimerDuration title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDuration duration](self, "duration");
  v6 = v5;
  -[MTTimerDuration lastModified](self, "lastModified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("duration with title: %@, duration: %f, lastModified: %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  -[MTTimerDuration duration](self, "duration");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kMTTimerDurationInterval"));

  -[MTTimerDuration title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("kMTTimerDurationTitle"));

  -[MTTimerDuration lastModified](self, "lastModified");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("kMTTimerDurationLastModified"));

  -[MTTimerDuration sound](self, "sound");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("kMTTimerDurationSound"));

}

- (NSString)title
{
  return self->_title;
}

- (MTSound)sound
{
  return self->_sound;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (double)duration
{
  return self->_duration;
}

- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4 sound:(id)a5 lastModified:(id)a6
{
  id v10;
  id v11;
  id v12;
  MTTimerDuration *v13;
  MTTimerDuration *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MTTimerDuration;
  v13 = -[MTTimerDuration init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[MTTimerDuration setTitle:](v13, "setTitle:", v10);
    -[MTTimerDuration setDuration:](v14, "setDuration:", a4);
    -[MTTimerDuration setLastModified:](v14, "setLastModified:", v12);
    if (v11)
    {
      -[MTTimerDuration setSound:](v14, "setSound:", v11);
    }
    else
    {
      +[MTSound defaultSoundForCategory:](MTSound, "defaultSoundForCategory:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTTimerDuration setSound:](v14, "setSound:", v15);

    }
  }

  return v14;
}

- (MTTimerDuration)initWithCoder:(id)a3
{
  id v4;
  MTTimerDuration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTTimerDuration;
  v5 = -[MTTimerDuration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMTTimerDurationInterval"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    -[MTTimerDuration setDuration:](v5, "setDuration:");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMTTimerDurationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerDuration setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMTTimerDurationLastModified"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerDuration setLastModified:](v5, "setLastModified:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMTTimerDurationSound"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTTimerDuration setSound:](v5, "setSound:", v9);

  }
  return v5;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSound:(id)a3
{
  objc_storeStrong((id *)&self->_sound, a3);
}

- (void)setLastModified:(id)a3
{
  objc_storeStrong((id *)&self->_lastModified, a3);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4 sound:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  MTTimerDuration *v12;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MTTimerDuration initWithTitle:duration:sound:lastModified:](self, "initWithTitle:duration:sound:lastModified:", v10, v9, v11, a4);

  return v12;
}

- (MTTimerDuration)initWithTitle:(id)a3 duration:(double)a4
{
  return -[MTTimerDuration initWithTitle:duration:sound:](self, "initWithTitle:duration:sound:", a3, 0, a4);
}

- (BOOL)isEqual:(id)a3
{
  MTTimerDuration *v4;
  MTTimerDuration *v5;
  MTTimerDuration *v6;
  MTTimerDuration *v7;
  BOOL v8;

  v4 = (MTTimerDuration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
      v8 = -[MTTimerDuration isEqualToDuration:](self, "isEqualToDuration:", v7);
    else
      v8 = 0;

  }
  return v8;
}

- (BOOL)isEqualToDuration:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[MTTimerDuration duration](self, "duration");
  v6 = v5;
  objc_msgSend(v4, "duration");
  if (v6 == v7)
  {
    -[MTTimerDuration title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "caseInsensitiveCompare:", v9) == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTTimerDuration hashString](self, "hashString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)hashString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[MTTimerDuration title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[MTTimerDuration title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v7);

  }
  -[MTTimerDuration duration](self, "duration");
  objc_msgSend(v3, "appendFormat:", CFSTR("%f"), v8);
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTTimerDuration *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  MTTimerDuration *v10;

  v4 = [MTTimerDuration alloc];
  -[MTTimerDuration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDuration duration](self, "duration");
  v7 = v6;
  -[MTTimerDuration sound](self, "sound");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTTimerDuration lastModified](self, "lastModified");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MTTimerDuration initWithTitle:duration:sound:lastModified:](v4, "initWithTitle:duration:sound:lastModified:", v5, v8, v9, v7);

  return v10;
}

@end
