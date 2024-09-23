@implementation HUShortcutsTriggerViewAccessoryPickerConfiguration

- (HUShortcutsTriggerViewAccessoryPickerConfiguration)init
{
  HUShortcutsTriggerViewAccessoryPickerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUShortcutsTriggerViewAccessoryPickerConfiguration;
  result = -[HUShortcutsTriggerViewAccessoryPickerConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_accessoryPool = 0;
    *(_OWORD *)&result->_sectionGroupingStyle = xmmword_1B9438C30;
    result->_servicesOnly = 0;
  }
  return result;
}

- (unint64_t)accessoryPool
{
  return self->_accessoryPool;
}

- (void)setAccessoryPool:(unint64_t)a3
{
  self->_accessoryPool = a3;
}

- (HFAccessoryLikeObjectContainer)customAccessoryContainer
{
  return self->_customAccessoryContainer;
}

- (void)setCustomAccessoryContainer:(id)a3
{
  objc_storeStrong((id *)&self->_customAccessoryContainer, a3);
}

- (unint64_t)sectionGroupingStyle
{
  return self->_sectionGroupingStyle;
}

- (void)setSectionGroupingStyle:(unint64_t)a3
{
  self->_sectionGroupingStyle = a3;
}

- (unint64_t)objectLevel
{
  return self->_objectLevel;
}

- (void)setObjectLevel:(unint64_t)a3
{
  self->_objectLevel = a3;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void)setFilterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)servicesOnly
{
  return self->_servicesOnly;
}

- (void)setServicesOnly:(BOOL)a3
{
  self->_servicesOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_customAccessoryContainer, 0);
}

@end
