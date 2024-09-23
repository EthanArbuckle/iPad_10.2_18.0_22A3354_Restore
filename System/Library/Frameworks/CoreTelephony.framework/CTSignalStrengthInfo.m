@implementation CTSignalStrengthInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSignalStrengthInfo bars](self, "bars");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", bars=%@"), v4);

  -[CTSignalStrengthInfo displayBars](self, "displayBars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayBars=%@"), v5);

  -[CTSignalStrengthInfo maxDisplayBars](self, "maxDisplayBars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", maxDisplayBars=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSignalStrengthInfo bars](self, "bars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setBars:", v6);

  -[CTSignalStrengthInfo displayBars](self, "displayBars");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDisplayBars:", v8);

  -[CTSignalStrengthInfo maxDisplayBars](self, "maxDisplayBars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setMaxDisplayBars:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTSignalStrengthInfo bars](self, "bars");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bars"));

  -[CTSignalStrengthInfo displayBars](self, "displayBars");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("display_bars"));

  -[CTSignalStrengthInfo maxDisplayBars](self, "maxDisplayBars");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("max_display_bars"));

}

- (CTSignalStrengthInfo)initWithCoder:(id)a3
{
  id v4;
  CTSignalStrengthInfo *v5;
  uint64_t v6;
  NSNumber *bars;
  uint64_t v8;
  NSNumber *displayBars;
  uint64_t v10;
  NSNumber *maxDisplayBars;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSignalStrengthInfo;
  v5 = -[CTSignalStrengthInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bars"));
    v6 = objc_claimAutoreleasedReturnValue();
    bars = v5->_bars;
    v5->_bars = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("display_bars"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayBars = v5->_displayBars;
    v5->_displayBars = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("max_display_bars"));
    v10 = objc_claimAutoreleasedReturnValue();
    maxDisplayBars = v5->_maxDisplayBars;
    v5->_maxDisplayBars = (NSNumber *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)bars
{
  return self->_bars;
}

- (void)setBars:(id)a3
{
  objc_storeStrong((id *)&self->_bars, a3);
}

- (NSNumber)displayBars
{
  return self->_displayBars;
}

- (void)setDisplayBars:(id)a3
{
  objc_storeStrong((id *)&self->_displayBars, a3);
}

- (NSNumber)maxDisplayBars
{
  return self->_maxDisplayBars;
}

- (void)setMaxDisplayBars:(id)a3
{
  objc_storeStrong((id *)&self->_maxDisplayBars, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxDisplayBars, 0);
  objc_storeStrong((id *)&self->_displayBars, 0);
  objc_storeStrong((id *)&self->_bars, 0);
}

@end
