@implementation NUHTMLBuilder

- (NUHTMLBuilder)init
{
  NUHTMLBuilder *v2;
  NSMutableString *v3;
  NSMutableString *string;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUHTMLBuilder;
  v2 = -[NUHTMLBuilder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    string = v2->_string;
    v2->_string = v3;

  }
  return v2;
}

- (id)HTML
{
  void *v2;
  void *v3;

  -[NUHTMLBuilder string](self, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)fullHTML
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NUHTMLBuilder string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<html><body>%@</body></html>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appendBreak
{
  void *v3;

  -[NUHTMLBuilder string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("<br />"));

  return self;
}

- (id)appendStrong:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUHTMLBuilder string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUHTMLBuilder encodeHTMLEntities:](self, "encodeHTMLEntities:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("<strong>%@</strong>"), v6);
  return self;
}

- (id)appendParagraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUHTMLBuilder string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTML");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("<p>%@</p>"), v6);
  return self;
}

- (id)appendParagraphText:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUHTMLBuilder string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUHTMLBuilder encodeHTMLEntities:](self, "encodeHTMLEntities:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("<p>%@</p>"), v6);
  return self;
}

- (id)appendLink:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[NUHTMLBuilder string](self, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUHTMLBuilder URLEncode:](self, "URLEncode:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUHTMLBuilder encodeHTMLEntities:](self, "encodeHTMLEntities:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendFormat:", CFSTR("<a href=\"%@\">%@</a>"), v9, v10);
  return self;
}

- (id)appendText:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUHTMLBuilder string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUHTMLBuilder encodeHTMLEntities:](self, "encodeHTMLEntities:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v6);
  return self;
}

- (id)appendHTML:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUHTMLBuilder string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "HTML");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendString:", v6);
  return self;
}

- (id)encodeHTMLEntities:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    2,
    0,
    objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("&quot;"),
    2,
    0,
    objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("&#x27;"),
    2,
    0,
    objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    2,
    0,
    objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    2,
    0,
    objc_msgSend(v3, "length"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)URLEncode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "URLQueryAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
