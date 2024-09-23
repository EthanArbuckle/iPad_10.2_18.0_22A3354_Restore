@implementation SwitchSubtree

- (PHASESoundEventNodeDefinition)subtree
{
  return self->_subtree;
}

- (void)setSubtree:(id)a3
{
  objc_storeStrong((id *)&self->_subtree, a3);
}

- (NSString)switchValue
{
  return self->_switchValue;
}

- (void)setSwitchValue:(id)a3
{
  objc_storeStrong((id *)&self->_switchValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchValue, 0);
  objc_storeStrong((id *)&self->_subtree, 0);
}

@end
