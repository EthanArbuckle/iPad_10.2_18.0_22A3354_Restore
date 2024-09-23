@implementation MKTableSeparatorRow

- (id)asciiRepresentationUsingColumns:(id)a3
{
  return (id)objc_msgSend(&stru_24E35A3B8, "stringByPaddingToLength:withString:startingAtIndex:", -[MKTableRow totalWidthOfColumns:](self, "totalWidthOfColumns:", a3), CFSTR("-"), 0);
}

- (id)csvRepresentation
{
  return 0;
}

@end
