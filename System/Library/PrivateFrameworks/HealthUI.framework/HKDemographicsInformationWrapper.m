@implementation HKDemographicsInformationWrapper

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HKBiologicalSexObject)biologicalSexObject
{
  return self->_biologicalSexObject;
}

- (void)setBiologicalSexObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HKQuantity)heightQuantity
{
  return self->_heightQuantity;
}

- (void)setHeightQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HKQuantity)weightQuantity
{
  return self->_weightQuantity;
}

- (void)setWeightQuantity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HKFitzpatrickSkinTypeObject)fitzpatrickSkinTypeObject
{
  return self->_fitzpatrickSkinTypeObject;
}

- (void)setFitzpatrickSkinTypeObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (HKBloodTypeObject)bloodTypeObject
{
  return self->_bloodTypeObject;
}

- (void)setBloodTypeObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (HKWheelchairUseObject)wheelchairUseObject
{
  return self->_wheelchairUseObject;
}

- (void)setWheelchairUseObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (HKCardioFitnessMedicationsUseObject)cardioFitnessMedicationsUseObject
{
  return self->_cardioFitnessMedicationsUseObject;
}

- (void)setCardioFitnessMedicationsUseObject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setPostalAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_cardioFitnessMedicationsUseObject, 0);
  objc_storeStrong((id *)&self->_wheelchairUseObject, 0);
  objc_storeStrong((id *)&self->_bloodTypeObject, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypeObject, 0);
  objc_storeStrong((id *)&self->_weightQuantity, 0);
  objc_storeStrong((id *)&self->_heightQuantity, 0);
  objc_storeStrong((id *)&self->_biologicalSexObject, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
