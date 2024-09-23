@implementation MKTableTitleRow

- (MKTableTitleRow)initWithTitle:(id)a3
{
  id v5;
  MKTableTitleRow *v6;
  MKTableTitleRow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTableTitleRow;
  v6 = -[MKTableRow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_title, a3);

  return v7;
}

- (id)asciiRepresentationUsingColumns:(id)a3
{
  return -[NSString padToLength:withString:](self->_title, "padToLength:withString:", -[MKTableRow totalWidthOfColumns:](self, "totalWidthOfColumns:", a3), CFSTR(" "));
}

- (id)csvRepresentation
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
