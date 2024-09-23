@implementation MSVLyricsSection

- (MSVLyricsSection)init
{
  MSVLyricsSection *v2;
  MSVLyricsSection *v3;
  NSArray *lines;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSVLyricsSection;
  v2 = -[MSVLyricsSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSVLyricsElement setType:](v2, "setType:", 0);
    lines = v3->_lines;
    v3->_lines = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MSVLyricsSection songPart](self, "songPart");
  -[MSVLyricsSection songPartText](self, "songPartText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsSection lines](self, "lines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v11.receiver = self;
  v11.super_class = (Class)MSVLyricsSection;
  -[MSVLyricsElement description](&v11, sel_description);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Song part: %ld (%@), %ld lines, element: %@"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setSongPartText:(id)a3
{
  id v5;
  int64_t v6;

  objc_storeStrong((id *)&self->_songPartText, a3);
  v5 = a3;
  v6 = +[MSVLyricsSection _songPartForText:](MSVLyricsSection, "_songPartForText:", v5);

  -[MSVLyricsSection setSongPart:](self, "setSongPart:", v6);
}

- (int64_t)songPart
{
  return self->_songPart;
}

- (void)setSongPart:(int64_t)a3
{
  self->_songPart = a3;
}

- (NSString)songPartText
{
  return self->_songPartText;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_storeStrong((id *)&self->_lines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_songPartText, 0);
}

+ (int64_t)_songPartForText:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("verse")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("chorus")))
      {
        if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("pre-chorus")))
        {
          if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("bridge")))
          {
            if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("intro")))
            {
              if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("outro")))
              {
                if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("refrain")))
                  v5 = 8 * (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("instrumental")) == 0);
                else
                  v5 = 7;
              }
              else
              {
                v5 = 6;
              }
            }
            else
            {
              v5 = 5;
            }
          }
          else
          {
            v5 = 4;
          }
        }
        else
        {
          v5 = 3;
        }
      }
      else
      {
        v5 = 2;
      }
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
