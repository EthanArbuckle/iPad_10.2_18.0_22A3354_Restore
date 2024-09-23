@implementation CCUISControlsGalleryConfiguration

- (NSArray)allowedControlSizes
{
  return (NSArray *)sub_2384FB340((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes, &qword_256916588);
}

- (void)setAllowedControlSizes:(id)a3
{
  sub_2384FB3BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_256916588, 0x24BDD16E0, &OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes);
}

- (NSArray)disallowedControlIdentities
{
  return (NSArray *)sub_2384FB340((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities, (unint64_t *)&unk_2569167F0);
}

- (void)setDisallowedControlIdentities:(id)a3
{
  sub_2384FB3BC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&unk_2569167F0, 0x24BE169A0, &OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities);
}

- (NSArray)disallowedExtensionIdentities
{
  return (NSArray *)sub_2384FB434((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities, (void (*)(_QWORD))MEMORY[0x24BE16918]);
}

- (void)setDisallowedExtensionIdentities:(id)a3
{
  sub_2384FB4A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))MEMORY[0x24BE16918], &OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities);
}

- (NSArray)suggestedControls
{
  return (NSArray *)sub_2384FB434((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls, (void (*)(_QWORD))type metadata accessor for CCUISConfiguredControl);
}

- (void)setSuggestedControls:(id)a3
{
  sub_2384FB4A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD))type metadata accessor for CCUISConfiguredControl, &OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls);
}

- (id)copyWithZone:(void *)a3
{
  CCUISControlsGalleryConfiguration *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2384FB524(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_238506E0C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (CCUISControlsGalleryConfiguration)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls) = 0;
  v3.receiver = self;
  v3.super_class = (Class)CCUISControlsGalleryConfiguration;
  return -[CCUISControlsGalleryConfiguration init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
