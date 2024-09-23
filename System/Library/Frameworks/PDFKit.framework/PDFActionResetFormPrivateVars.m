@implementation PDFActionResetFormPrivateVars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fields, 0);
}

@end
