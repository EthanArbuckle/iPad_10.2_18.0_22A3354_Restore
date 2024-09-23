@implementation BWInferenceDependencyProvider

- (id)dependenciesForInputVideoRequirement:(id)a3
{
  return -[NSMapTable objectForKey:](self->_dependenciesByInputVideoRequirements, "objectForKey:", a3);
}

- (NSMapTable)dependenciesByOutputVideoRequirements
{
  return self->_dependenciesByOutputVideoRequirements;
}

- (NSMapTable)dependenciesByInputVideoRequirements
{
  return self->_dependenciesByInputVideoRequirements;
}

- (NSDictionary)providedVideoRequirementsByAttachedMediaKey
{
  return self->_providedVideoRequirementsByAttachedMediaKey;
}

- (int)supportedPixelBufferCompressionType
{
  return self->_supportedPixelBufferCompressionType;
}

- (void)setSupportedPixelBufferCompressionType:(int)a3
{
  self->_supportedPixelBufferCompressionType = a3;
}

- (void)setProvidedVideoRequirementsByAttachedMediaKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setConsumedVideoAttachedMediaKeys:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (id)dependenciesForOutputVideoRequirement:(id)a3
{
  return -[NSMapTable objectForKey:](self->_dependenciesByOutputVideoRequirements, "objectForKey:", a3);
}

- (NSArray)allOutputVideoDependencies
{
  return -[NSDictionary allKeys](-[NSMapTable dictionaryRepresentation](self->_dependenciesByOutputVideoRequirements, "dictionaryRepresentation"), "allKeys");
}

- (NSArray)allInputVideoDependencies
{
  return -[NSDictionary allKeys](-[NSMapTable dictionaryRepresentation](self->_dependenciesByInputVideoRequirements, "dictionaryRepresentation"), "allKeys");
}

- (BWInferenceDependencyProvider)init
{
  BWInferenceDependencyProvider *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWInferenceDependencyProvider;
  v2 = -[BWInferenceDependencyProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    objc_msgSend(v3, "setHashFunction:", satisfiedVideoRequirementHash);
    objc_msgSend(v3, "setIsEqualFunction:", satisfiedVideoRequirementCheck);
    v4 = objc_msgSend(MEMORY[0x1E0CB3870], "pointerFunctionsWithOptions:", 0);
    v2->_dependenciesByInputVideoRequirements = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v3, v4, 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyPointerFunctions:valuePointerFunctions:capacity:", v3, v4, 0);
    v2->_providedVideoRequirementsByAttachedMediaKey = 0;
    v2->_consumedVideoAttachedMediaKeys = 0;
    v2->_dependenciesByOutputVideoRequirements = (NSMapTable *)v5;
  }
  return v2;
}

- (NSSet)consumedVideoAttachedMediaKeys
{
  return self->_consumedVideoAttachedMediaKeys;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceDependencyProvider;
  -[BWInferenceDependencyProvider dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %lu inputVideoDependencies %lu outputVideoDependencies consumedKeys:%@ providedKeys:%@"), objc_opt_class(), self, -[NSMapTable count](self->_dependenciesByInputVideoRequirements, "count"), -[NSMapTable count](self->_dependenciesByOutputVideoRequirements, "count"), self->_consumedVideoAttachedMediaKeys, -[NSDictionary allKeys](self->_providedVideoRequirementsByAttachedMediaKey, "allKeys"));
}

@end
