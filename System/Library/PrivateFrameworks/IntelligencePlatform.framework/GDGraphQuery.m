@implementation GDGraphQuery

- (NSString)objectFTSTerm
{
  return self->_objectFTSTerm;
}

- (void)setObjectFTSTerm:(id)a3
{
  objc_storeStrong((id *)&self->_objectFTSTerm, a3);
}

- (NSArray)subjects
{
  return self->_subjects;
}

- (void)setSubjects:(id)a3
{
  objc_storeStrong((id *)&self->_subjects, a3);
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void)setPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_predicates, a3);
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
  objc_storeStrong((id *)&self->_objects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_subjects, 0);
  objc_storeStrong((id *)&self->_objectFTSTerm, 0);
}

@end
