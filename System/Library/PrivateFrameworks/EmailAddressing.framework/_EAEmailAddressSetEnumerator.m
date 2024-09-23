@implementation _EAEmailAddressSetEnumerator

- (_EAEmailAddressSetEnumerator)initWithSet:(id)a3
{
  id v5;
  _EAEmailAddressSetEnumerator *v6;
  _EAEmailAddressSetEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EAEmailAddressSetEnumerator;
  v6 = -[_EAEmailAddressSetEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_set, a3);

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[EAEmailAddressSet countByEnumeratingWithState:objects:count:](self->_set, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)nextObject
{
  id v2;
  id v4;

  v4 = 0;
  v2 = -[EAEmailAddressSet countByEnumeratingWithState:objects:count:](self->_set, "countByEnumeratingWithState:objects:count:", &self->_state, &v4, 1);
  if (v2)
    v2 = v4;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
}

@end
