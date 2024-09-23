id static HealthFeaturesUtilities.bundle.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_23DDDFE74();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  return v1;
}

ValueMetadata *type metadata accessor for HealthFeaturesUtilities()
{
  return &type metadata for HealthFeaturesUtilities;
}

uint64_t sub_23DDDFE74()
{
  return MEMORY[0x24BDCF9E0]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

