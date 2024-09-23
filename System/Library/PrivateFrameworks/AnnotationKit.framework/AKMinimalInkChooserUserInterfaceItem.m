@implementation AKMinimalInkChooserUserInterfaceItem

- (PKInk)ink
{
  return self->_ink;
}

- (void)setInk:(id)a3
{
  objc_storeStrong((id *)&self->_ink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ink, 0);
}

@end
