@implementation CHRecognitionSessionIndexableContent

- (NSString)indexableTextRepresentation
{
  return self->_indexableTextRepresentation;
}

- (NSString)presentableTextRepresentation
{
  return self->_presentableTextRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentableTextRepresentation, 0);
  objc_storeStrong((id *)&self->_indexableTextRepresentation, 0);
}

@end
