@implementation FCCardStyle

- (FCCardStyle)initWithTitleForegroundColor:(id)a3 eyebrowForegroundColor:(id)a4 cardBackgroundColor:(id)a5 cardForegroundColor:(id)a6 sauceGradient:(id)a7 ctaBackgroundColor:(id)a8 ctaForegroundColor:(id)a9
{
  id v16;
  id v17;
  FCCardStyle *v18;
  FCCardStyle *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)FCCardStyle;
  v18 = -[FCCardStyle init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_titleForegroundColor, a3);
    objc_storeStrong((id *)&v19->_eyebrowForegroundColor, a4);
    objc_storeStrong((id *)&v19->_cardBackgroundColor, a5);
    objc_storeStrong((id *)&v19->_cardForegroundColor, a6);
    objc_storeStrong((id *)&v19->_sauceGradient, a7);
    objc_storeStrong((id *)&v19->_ctaBackgroundColor, a8);
    objc_storeStrong((id *)&v19->_ctaForegroundColor, a9);
  }

  return v19;
}

+ (id)styleWithConfigDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  FCCardStyle *v18;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("titleForegroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eyebrowForegroundColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cardBackgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cardForegroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sauceColorGradient"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    +[FCColorGradient colorGradientWithConfigDict:](FCColorGradient, "colorGradientWithConfigDict:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ctaBackgroundColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ctaForegroundColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCColor nullableColorWithHexString:](FCColor, "nullableColorWithHexString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[FCCardStyle initWithTitleForegroundColor:eyebrowForegroundColor:cardBackgroundColor:cardForegroundColor:sauceGradient:ctaBackgroundColor:ctaForegroundColor:]([FCCardStyle alloc], "initWithTitleForegroundColor:eyebrowForegroundColor:cardBackgroundColor:cardForegroundColor:sauceGradient:ctaBackgroundColor:ctaForegroundColor:", v5, v7, v9, v11, v13, v15, v17);
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  FCCardStyle *v4;
  FCCardStyle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;

  v4 = (FCCardStyle *)a3;
  if (self == v4)
  {
    v26 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0DE7910];
      -[FCCardStyle titleForegroundColor](self, "titleForegroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCardStyle titleForegroundColor](v5, "titleForegroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8))
      {
        v9 = (void *)MEMORY[0x1E0DE7910];
        -[FCCardStyle eyebrowForegroundColor](self, "eyebrowForegroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCCardStyle eyebrowForegroundColor](v5, "eyebrowForegroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "nf_object:isEqualToObject:", v10, v11))
        {
          v12 = (void *)MEMORY[0x1E0DE7910];
          -[FCCardStyle cardBackgroundColor](self, "cardBackgroundColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCardStyle cardBackgroundColor](v5, "cardBackgroundColor");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v13;
          if (objc_msgSend(v12, "nf_object:isEqualToObject:", v13))
          {
            v14 = (void *)MEMORY[0x1E0DE7910];
            -[FCCardStyle cardForegroundColor](self, "cardForegroundColor");
            v15 = objc_claimAutoreleasedReturnValue();
            -[FCCardStyle cardForegroundColor](v5, "cardForegroundColor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "nf_object:isEqualToObject:", v15))
            {
              v34 = (void *)MEMORY[0x1E0DE7910];
              -[FCCardStyle sauceGradient](self, "sauceGradient");
              v16 = objc_claimAutoreleasedReturnValue();
              -[FCCardStyle sauceGradient](v5, "sauceGradient");
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = v34;
              v33 = (void *)v17;
              v35 = (void *)v16;
              v19 = objc_msgSend(v18, "nf_object:isEqualToObject:", v16);
              v20 = (void *)v15;
              if (v19)
              {
                v31 = (void *)MEMORY[0x1E0DE7910];
                -[FCCardStyle ctaBackgroundColor](self, "ctaBackgroundColor");
                v21 = objc_claimAutoreleasedReturnValue();
                -[FCCardStyle ctaBackgroundColor](v5, "ctaBackgroundColor");
                v22 = objc_claimAutoreleasedReturnValue();
                v23 = v31;
                v30 = (void *)v22;
                v32 = (void *)v21;
                if (objc_msgSend(v23, "nf_object:isEqualToObject:", v21))
                {
                  v29 = (void *)MEMORY[0x1E0DE7910];
                  -[FCCardStyle ctaForegroundColor](self, "ctaForegroundColor");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FCCardStyle ctaForegroundColor](v5, "ctaForegroundColor");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v29, "nf_object:isEqualToObject:", v24, v25);

                }
                else
                {
                  v26 = 0;
                }
                v27 = (void *)v37;
                v13 = v38;

              }
              else
              {
                v26 = 0;
                v27 = (void *)v37;
                v13 = v38;
              }

            }
            else
            {
              v20 = (void *)v15;
              v26 = 0;
              v27 = (void *)v37;
              v13 = v38;
            }

          }
          else
          {
            v26 = 0;
            v27 = (void *)v37;
          }

        }
        else
        {
          v26 = 0;
        }

      }
      else
      {
        v26 = 0;
      }

    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  -[FCCardStyle titleForegroundColor](self, "titleForegroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCCardStyle ctaForegroundColor](self, "ctaForegroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[FCCardStyle cardBackgroundColor](self, "cardBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[FCCardStyle cardForegroundColor](self, "cardForegroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[FCCardStyle eyebrowForegroundColor](self, "eyebrowForegroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[FCCardStyle sauceGradient](self, "sauceGradient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[FCCardStyle ctaBackgroundColor](self, "ctaBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (FCColor)titleForegroundColor
{
  return self->_titleForegroundColor;
}

- (void)setTitleForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FCColor)eyebrowForegroundColor
{
  return self->_eyebrowForegroundColor;
}

- (void)setEyebrowForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FCColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (void)setCardBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FCColor)cardForegroundColor
{
  return self->_cardForegroundColor;
}

- (void)setCardForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FCColorGradient)sauceGradient
{
  return self->_sauceGradient;
}

- (void)setSauceGradient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (FCColor)ctaBackgroundColor
{
  return self->_ctaBackgroundColor;
}

- (void)setCtaBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (FCColor)ctaForegroundColor
{
  return self->_ctaForegroundColor;
}

- (void)setCtaForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctaForegroundColor, 0);
  objc_storeStrong((id *)&self->_ctaBackgroundColor, 0);
  objc_storeStrong((id *)&self->_sauceGradient, 0);
  objc_storeStrong((id *)&self->_cardForegroundColor, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_eyebrowForegroundColor, 0);
  objc_storeStrong((id *)&self->_titleForegroundColor, 0);
}

@end
