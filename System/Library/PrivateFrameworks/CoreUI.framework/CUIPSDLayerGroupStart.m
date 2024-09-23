@implementation CUIPSDLayerGroupStart

- (void)setName:(id)a3
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIMutablePSDImageRef.mm"), 154, CFSTR("Group Names need to be specified on the CUIPSDLayerGroupEnd (because this fits Photoshop's file format), not in CUIPSDLayerGroupStart"));
}

@end
