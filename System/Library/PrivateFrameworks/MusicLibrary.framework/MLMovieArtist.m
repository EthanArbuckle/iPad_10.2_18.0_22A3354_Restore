@implementation MLMovieArtist

- (MLMovieArtist)init
{
  return -[MLMovieArtist initWithMovieArtistDictionary:](self, "initWithMovieArtistDictionary:", 0);
}

- (MLMovieArtist)initWithMovieArtistDictionary:(id)a3
{
  id v4;
  MLMovieArtist *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLMovieArtist;
  v5 = -[MLMovieArtist init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    else
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMovieArtistDictionary:", self->_dictionary);
}

- (NSString)artistName
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("name"));
}

- (NSNumber)ITunesStoreIdentifier
{
  return (NSNumber *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("adamId"));
}

- (void)setArtistName:(id)a3
{
  -[MLMovieArtist _setValueCopy:forKey:](self, "_setValueCopy:forKey:", a3, CFSTR("name"));
}

- (void)setITunesStoreIdentifier:(id)a3
{
  -[MLMovieArtist _setValue:forKey:](self, "_setValue:forKey:", a3, CFSTR("adamId"));
}

- (id)copyMovieArtistDictionary
{
  return (id)-[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
}

- (void)_setValueCopy:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[MLMovieArtist _setValue:forKey:](self, "_setValue:forKey:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
