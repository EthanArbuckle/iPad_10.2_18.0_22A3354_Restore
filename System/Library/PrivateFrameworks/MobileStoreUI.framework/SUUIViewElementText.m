@implementation SUUIViewElementText

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4
{
  return -[SUUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:](self, "attributedStringWithDefaultFont:foregroundColor:textAlignment:", a3, a4, 0);
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5
{
  return -[SUUIViewElementText attributedStringWithDefaultFont:foregroundColor:textAlignment:style:](self, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", a3, a4, a5, 0);
}

- (id)attributedStringWithDefaultFont:(id)a3 foregroundColor:(id)a4 style:(id)a5
{
  return -[IKTextParser attributedStringWithFont:foregroundColor:textAlignment:style:](self, "attributedStringWithFont:foregroundColor:textAlignment:style:", a3, a4, 0, a5);
}

@end
